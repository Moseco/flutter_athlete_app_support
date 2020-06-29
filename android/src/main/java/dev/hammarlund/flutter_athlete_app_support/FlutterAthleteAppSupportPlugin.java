package dev.hammarlund.flutter_athlete_app_support;

import android.content.Context;
import android.os.Build;
import android.os.VibrationEffect;
import android.os.Vibrator;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterAthleteAppSupportPlugin */
public class FlutterAthleteAppSupportPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;

  private Vibrator vibrator;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_athlete_app_support");
    channel.setMethodCallHandler(this);

    this.vibrator = (Vibrator) flutterPluginBinding.getApplicationContext().getSystemService(Context.VIBRATOR_SERVICE);
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_athlete_app_support");
    channel.setMethodCallHandler(new FlutterAthleteAppSupportPlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("hasVibrator")) {
      result.success(vibrator.hasVibrator());
    } else if (call.method.equals("vibrate")) {
      vibrate(500);
      result.success(null);
    } else {
      result.notImplemented();
    }
  }

  @SuppressWarnings("deprecation")
  private void vibrate(long duration) {
    if (vibrator.hasVibrator()) {
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
        vibrator.vibrate(VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE));
      } else {
        vibrator.vibrate(duration);
      }
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
