import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_athlete_app_support/flutter_athlete_app_support.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_athlete_app_support');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterAthleteAppSupport.platformVersion, '42');
  });
}
