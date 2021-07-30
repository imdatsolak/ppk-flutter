#import "PpkFlutterPlugin.h"
#if __has_include(<ppk_flutter/ppk_flutter-Swift.h>)
#import <ppk_flutter/ppk_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ppk_flutter-Swift.h"
#endif

@implementation PpkFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPpkFlutterPlugin registerWithRegistrar:registrar];
}
@end
