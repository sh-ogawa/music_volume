#import "MusicVolumePlugin.h"
#import <music_volume/music_volume-Swift.h>

@implementation MusicVolumePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMusicVolumePlugin registerWithRegistrar:registrar];
}
@end
