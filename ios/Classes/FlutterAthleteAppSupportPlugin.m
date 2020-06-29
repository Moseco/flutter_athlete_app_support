#import "FlutterAthleteAppSupportPlugin.h"
#import <AudioToolbox/AudioServices.h>

@implementation FlutterAthleteAppSupportPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_athlete_app_support"
            binaryMessenger:[registrar messenger]];
  FlutterAthleteAppSupportPlugin* instance = [[FlutterAthleteAppSupportPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"openSettings" isEqualToString:call.method]) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    result(nil);
  } else if ([@"hasVibrator" isEqualToString:call.method]) {
    result([self isDevicePhysical]);
  } else if ([@"vibrate" isEqualToString:call.method]) {
    if([self isDevicePhysical]){
      AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    }
    result(nil);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

// return value is false if code is run on a simulator
- (NSNumber*)isDevicePhysical {
#if TARGET_OS_SIMULATOR
  return [NSNumber numberWithBool:NO];
#else
  return [NSNumber numberWithBool:YES];
#endif
}

@end
