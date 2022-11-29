#import "FlutterExpandableWidgetPlugin.h"
#if __has_include(<flutter_expandable_widget/flutter_expandable_widget-Swift.h>)
#import <flutter_expandable_widget/flutter_expandable_widget-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_expandable_widget-Swift.h"
#endif

@implementation FlutterExpandableWidgetPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterExpandableWidgetPlugin registerWithRegistrar:registrar];
}
@end
