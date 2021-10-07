#import "FlurryAnalyticsPlugin.h"
#if __has_include(<flurry_analytics/flurry_analytics-Swift.h>)
#import <flurry_analytics/flurry_analytics-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flurry_analytics-Swift.h"
#endif

@implementation FlurryAnalyticsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlurryAnalyticsPlugin registerWithRegistrar:registrar];
}
@end
