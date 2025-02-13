library navigation_detector;

import 'dart:io';

import 'package:flutter/services.dart';

enum NavigationDetectorEnumMode { gesture, buttons, unsupported, error }

class NavigationDetector {
  static const MethodChannel _channel = MethodChannel('navigation_detector');

  /// Returns the NavigationMode enum (gesture, buttons, unsupported)
  static Future<NavigationDetectorEnumMode> getNavigationMode() async {
    try {
      if (Platform.isAndroid) {
        final String mode = await _channel.invokeMethod('getNavigationMode');
        switch (mode) {
          case 'gesture':
            return NavigationDetectorEnumMode.gesture;
          case 'buttons':
            return NavigationDetectorEnumMode.buttons;
          default:
            return NavigationDetectorEnumMode.unsupported;
        }
      } else {
        return NavigationDetectorEnumMode.unsupported;
      }
    } catch (e) {
      return NavigationDetectorEnumMode.error;
    }
  }
}
