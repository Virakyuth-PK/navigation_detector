import 'package:flutter_test/flutter_test.dart';
import 'package:navigation_detector/navigation_detector.dart';
import 'package:navigation_detector/navigation_detector_platform_interface.dart';
import 'package:navigation_detector/navigation_detector_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNavigationDetectorPlatform
    with MockPlatformInterfaceMixin
    implements NavigationDetectorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NavigationDetectorPlatform initialPlatform = NavigationDetectorPlatform.instance;

  test('$MethodChannelNavigationDetector is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNavigationDetector>());
  });

  test('getPlatformVersion', () async {
    NavigationDetector navigationDetectorPlugin = NavigationDetector();
    MockNavigationDetectorPlatform fakePlatform = MockNavigationDetectorPlatform();
    NavigationDetectorPlatform.instance = fakePlatform;

    expect(await navigationDetectorPlugin.getPlatformVersion(), '42');
  });
}
