#import "Flurry.h"
#import "FlurryDataPlugin.h"

@implementation FlurryDataPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  //[SwiftFlurryDataPlugin registerWithRegistrar:registrar];
    FlutterMethodChannel* channel = [FlutterMethodChannel
          methodChannelWithName:@"com.bossanyit.flurry_data.flurry_data"
                binaryMessenger:[registrar messenger]];
      FlurryDataPlugin* instance = [[FlurryDataPlugin alloc] init];
      [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"initialize" isEqualToString:call.method]) {
        NSDictionary *arguments = (NSDictionary*)call.arguments;
        NSString *apiKey = (NSString*)arguments[@"api_key_ios"];
        BOOL isLogEnabled = (BOOL)arguments[@"is_log_enabled"];

        if (isLogEnabled){

            FlurrySessionBuilder* builder = [[[FlurrySessionBuilder new]
                                                withLogLevel:FlurryLogLevelAll]
                                               withCrashReporting:YES];

            [Flurry startSession:apiKey withSessionBuilder:builder];

        } else {

            FlurrySessionBuilder* builder = [[[FlurrySessionBuilder new]
                                              withLogLevel:FlurryLogLevelNone]
                                             withCrashReporting:YES];

            [Flurry startSession:apiKey withSessionBuilder:builder];
        }

        result(nil);
    } else if ([@"logEvent" isEqualToString:call.method]) {
        NSDictionary *arguments = (NSDictionary*)call.arguments;
        NSString *message = (NSString*)arguments[@"message"];
        [Flurry logEvent:message];
        result(nil);

    } else if ([@"userId" isEqualToString:call.method]) {
        NSDictionary *arguments = (NSDictionary*)call.arguments;
        NSString *userId = (NSString*)arguments[@"userId"];
        [Flurry setUserID:userId];
        result(nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}
@end
