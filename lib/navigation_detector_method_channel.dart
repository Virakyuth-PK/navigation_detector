import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'navigation_detector_platform_interface.dart';

/// An implementation of [NavigationDetectorPlatform] that uses method channels.
class MethodChannelNavigationDetector extends NavigationDetectorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('navigation_detector');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
