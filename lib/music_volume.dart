import 'dart:async';

import 'package:flutter/services.dart';

class MusicVolume {
  static const MethodChannel _channel =
      const MethodChannel('ooga04/music_volume');

  static Future<int> get maxVolume async {
    int maxVolume = await _channel.invokeMethod('getMaxVolume');
    return maxVolume;
  }

  static Future<int> get currentVolume async {
    int currentVolume = await _channel.invokeMethod('getCurrentVolume');
    return currentVolume;
  }

  static Future<int> get isMute async {
    int isMute = await _channel.invokeMethod('isMute');
    return isMute;
  }

  static Future<void> changeVolume (int volume, int muteFlag) async {
    await _channel.invokeMethod('setVolume', {
      "volume": volume,
      "mute": muteFlag
    });
    return;
  }
}
