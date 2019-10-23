import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_volume/music_volume.dart';

void main() {
  const MethodChannel channel = MethodChannel('ooga04/music_volume');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == "getMaxVolume") return 7;
      if (methodCall.method == "getCurrentVolume") return 2;
      if (methodCall.method == "isMute") return 0;
      if (methodCall.method == "setVolume") return 0;

      return -99;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getMaxVolume', () async {
    expect(await MusicVolume.maxVolume, 7);
  });

  test('getCurrentVolume', () async {
    expect(await MusicVolume.currentVolume, 2);
  });

  test('isMute', () async {
    expect(await MusicVolume.isMute, 0);
  });

  test('setVolume', () async {
    // このセッターのテストの仕方が判らない
    await MusicVolume.changeVolume(5, 1);
    expect(0, 0);
  });

}
