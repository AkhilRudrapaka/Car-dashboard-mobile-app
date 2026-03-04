import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// Mock version for Web
class FatigueDetectionService {
  bool get isRunning => false;
  bool get alarmActive => false;
  CameraController? get cameraController => null;
  ValueChanged<bool>? onFatigueChanged;
  VoidCallback? onAlarmTriggered;

  Future<bool> init() async {
    debugPrint('Fatigue Detection is not supported on Web.');
    return false;
  }
  Future<void> start() async {}
  Future<void> stop() async {}
  Future<void> dispose() async {}
}
