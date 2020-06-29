import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAthleteAppSupport {
  static const MethodChannel _channel =
      const MethodChannel('flutter_athlete_app_support');

  static openSettings() async {
    await _channel.invokeMethod("openSettings");
  }

  static Future<bool> hasVibrator() => _channel.invokeMethod("hasVibrator");

  static Future<void> vibrate() => _channel.invokeMethod("vibrate");
}
