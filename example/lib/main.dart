import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flurry_data/flurry_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await FlurryData.initialize(
        androidKey: "QX7WZTNJ8468J6SR8DR311",
        iosKey: "XCCWQH4MCD45JHSM4BYN11",
        enableLog: true);
    await FlurryData.setUserId("userId");
    await FlurryData.logEvent("eventName");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('A FlurryData plugin example app'),
        ),
        body: Center(
          child: Text(
              'Should log event. Please close the app and wait a few seconds for events to be sent.'),
        ),
      ),
    );
  }
}
