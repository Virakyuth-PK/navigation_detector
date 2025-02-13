import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'navigation_detector_method_channel.dart';

abstract class NavigationDetectorPlatform extends PlatformInterface {
  /// Constructs a NavigationDetectorPlatform.
  NavigationDetectorPlatform() : super(token: _token);

  static final Object _token = Object();

  static NavigationDetectorPlatform _instance = MethodChannelNavigationDetector();

  /// The default instance of [NavigationDetectorPlatform] to use.
  ///
  /// Defaults to [MethodChannelNavigationDetector].
  static NavigationDetectorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NavigationDetectorPlatform] when
  /// they register themselves.
  static set instance(NavigationDetectorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
