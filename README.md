# music_volume

This package is a plugin to change the volume.

Only Support android.media.AudioManager.STREAM_MUSIC, so very simple package.

# Using

```dart
var _currentVolume = await MusicVolume.currentVolume;
var _maxVolume = await MusicVolume.maxVolume;
var _isMute = await MusicVolume.isMute;
await  MusicVolume.changeVolume(_maxVolume, 0);

// ・・・ playing music logic

await  MusicVolume.changeVolume(_currentVolume, _isMute);

```