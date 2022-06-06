import 'package:flutter/services.dart';
import 'package:maps/native/platform.dart';

class BackgroundLocations {
  final _channel = const MethodChannel('app.getnerdify/background-location');

  Future<void> startForegroundService() async {
    if (isAndroid) {
      await _channel.invokeMethod('start');
    }
  }

  Future<void> stopForegroundService() async {
    if (isAndroid) {
      await _channel.invokeMethod('stop');
    }
  }
}
