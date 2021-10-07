
import 'dart:async';

import 'package:flutter/services.dart';

class FlurryAnalytics {
  static const MethodChannel _channel = MethodChannel('flurry_analytics');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
