# flurry_data
A Null-Safe Flutter plugin to use Flurry Analytics.
This plugin logs events, sessions, userId

DISCONTINUED since Flurry does not support events in the Mobile App

## Getting Started

This is a Flutter plugin to use Flurry Analytics. It implements native calls to [Flurry Android SDK][flurry_sdk_android] and [Flurry iOS SDK][flurry_sdk_ios]. The plugin logs sessions, crash detections, simple event logging, and UserId.

## Installation
Add flurry_data: ^0.0.2 in your pubspec.yaml dependencies.

## How to use #
importing the library:
``` dart
import 'package:flurry_data/flurry_data.dart';
```
initialization:
``` dart
await FlurryData.initialize(androidKey: "xxx", iosKey: "xxx", enableLog: true);
```
logging/setting userId:
``` dart
FlurryData.setUserId("1234");
```

logging event:

``` dart
FlurryData.logEvent("event name");
```

[flurry_sdk_android]: https://developer.yahoo.com/flurry/docs/integrateflurry/android
[flurry_sdk_ios]: https://developer.yahoo.com/flurry/docs/integrateflurry/ios

