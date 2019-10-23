package ooga.sh4.jp.music_volume;

import android.content.Context;
import android.media.AudioManager;
import android.os.Build;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** MusicVolumePlugin */
public class MusicVolumePlugin implements MethodCallHandler {

  private static AudioManager manager;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "ooga04/music_volume");
    channel.setMethodCallHandler(new MusicVolumePlugin());

    manager = (AudioManager)registrar.activeContext().getSystemService(Context.AUDIO_SERVICE);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    switch (call.method) {
      case "getMaxVolume":
        result.success(manager.getStreamMaxVolume(AudioManager.STREAM_MUSIC));
        break;
      case "getCurrentVolume":
        result.success(manager.getStreamVolume(AudioManager.STREAM_MUSIC));
        break;
      case "isMute":
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
          int value = manager.isStreamMute(AudioManager.STREAM_MUSIC) ? 1 : 0;
          result.success(value);
        } else {
          // ミュート自体がサポートされてないからゼロを渡しとく
          result.success(0);
        }
        break;
      case "setVolume":
        Integer volume = call.argument("volume");
        if (volume == null) {
          throw new IllegalArgumentException("volume is null in call.arguments");
        }
        Integer mute = call.argument("mute");
        if (mute == null) {
          mute = 0;
        }
        manager.setStreamVolume(AudioManager.STREAM_MUSIC, volume, mute);
        result.success("success: change volume.");

        break;
      default:
        result.notImplemented();
        break;
    }
  }
}
