import 'dart:async';
import 'dart:io'; // Import 'dart:io' to check platform

import 'package:flutter/services.dart';

class NavigationDetector {
  static const MethodChannel _channel = MethodChannel('navigation_detector');

  /// Returns `"gesture"` for gesture navigation, `"buttons"` for button navigation.
  /// Returns `"unsupported"` on non-Android platforms.
  static Future<String> getNavigationMode() async {
    if (!Platform.isAndroid) {
      return 'unsupported'; // Prevent usage on iOS
    }

    try {
      final String mode = await _channel.invokeMethod('getNavigationMode');
      return mode;
    } catch (e) {
      return 'error';
    }
  }
}
