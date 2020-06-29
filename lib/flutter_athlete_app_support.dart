import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAthleteAppSupport {
  static const MethodChannel _channel =
      const MethodChannel('flutter_athlete_app_support');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
