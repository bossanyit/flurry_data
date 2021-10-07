import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flurry_analytics/flurry_analytics.dart';

void main() {
  const MethodChannel channel = MethodChannel('flurry_analytics');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlurryAnalytics.platformVersion, '42');
  });
}
