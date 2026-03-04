import 'package:flutter/foundation.dart';

enum TireStatus { healthy, low, flat }

class TireData {
  final String id;
  final String label;
  final int rssi;
  final TireStatus status;
  final double pressure;

  const TireData({
    required this.id,
    required this.label,
    required this.rssi,
    required this.status,
    required this.pressure,
  });

  TireData copyWith({int? rssi, TireStatus? status, double? pressure}) =>
      TireData(
        id: id, label: label,
        rssi: rssi ?? this.rssi,
        status: status ?? this.status,
        pressure: pressure ?? this.pressure,
      );

  int get signalPercent => 0;
}

class TpmsService {
  static final TpmsService instance = TpmsService._();
  TpmsService._();

  final ValueNotifier<TireData> flNotifier = ValueNotifier(_initial('TIRE_FL', 'Front Left'));
  final ValueNotifier<TireData> frNotifier = ValueNotifier(_initial('TIRE_FR', 'Front Right'));
  final ValueNotifier<TireData> rlNotifier = ValueNotifier(_initial('TIRE_RL', 'Rear Left'));
  final ValueNotifier<TireData> rrNotifier = ValueNotifier(_initial('TIRE_RR', 'Rear Right'));

  final ValueNotifier<bool> isScanning = ValueNotifier(false);
  final ValueNotifier<bool> btOn = ValueNotifier(false);
  final ValueNotifier<String> statusText = ValueNotifier('TPMS is not supported on Web.');

  static TireData _initial(String id, String label) => TireData(
        id: id, label: label,
        rssi: -100, status: TireStatus.flat, pressure: 0.0,
      );

  Future<void> init() async {}
  void stopMonitoring() {}
}
