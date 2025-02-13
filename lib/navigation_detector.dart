
import 'navigation_detector_platform_interface.dart';

class NavigationDetector {
  Future<String?> getPlatformVersion() {
    return NavigationDetectorPlatform.instance.getPlatformVersion();
  }
}
