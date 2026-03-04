import 'package:flutter/foundation.dart';

enum LightMode { day, twilight, night }

class AmbientLightService {
  AmbientLightService._();
  static final AmbientLightService instance = AmbientLightService._();

  LightMode get currentMode => LightMode.day;
  double get currentLux => 500.0;
  ValueChanged<LightMode>? onModeChanged;

  Future<void> start() async {
    debugPrint('Ambient Light Sensor is not supported on Web.');
  }
  void stop() {}
  void forceMode(LightMode mode) {
    onModeChanged?.call(mode);
  }
}
