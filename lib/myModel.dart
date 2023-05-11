import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:teknozone/parser.dart';

class MyModel extends ChangeNotifier {
  late StreamSubscription<DiscoveredDevice> scanStream;
  late FlutterReactiveBle flutterReactiveBle;
  late QualifiedCharacteristic rxCharacteristic;
  bool isScanStarted = false;
  bool isDeviceFound = false;
  bool isConnected = false;
  late DiscoveredDevice discoveredDevice;
  String akt1 = "";
  String akt2 = "";
  String cdt1 = "";
  String cdt2 = "";
  double ppm = 0;
  double temp = 0;
  int moisture = 0;

  void scanStarted(StreamSubscription<DiscoveredDevice> stream) {
    isScanStarted = true;
    scanStream = stream;
    notifyListeners();
  }

  void setIsScanStarted(bool value) {
    isScanStarted = value;
    notifyListeners();
  }

  void deviceFounded(DiscoveredDevice device) {
    isDeviceFound = true;
    discoveredDevice = device;
  }

  void setIsDeviceFound(bool value) {
    isDeviceFound = value;
    notifyListeners();
  }

  void setIsConnected(bool value) {
    isConnected = value;
    notifyListeners();
  }

  void setDiscoveredDevice(DiscoveredDevice value) {
    print("Device: ${value.name}");
    discoveredDevice = value;
    notifyListeners();
  }

  void setValues(Parser parser) {
    akt1 = parser.getAKT1();
    akt2 = parser.getAKT2();
    cdt1 = parser.getCDT1();
    cdt2 = parser.getCDT2();
    temp = parser.getTemp();
    ppm = parser.getPPM();
    moisture = parser.getMoisture();
    print("Moisture: $moisture");
    notifyListeners();
  }

  void setAKT1(String value) {
    akt1 = value;
    notifyListeners();
  }

  void setAKT2(String value) {
    akt2 = value;
    notifyListeners();
  }

  void setCDT1(String value) {
    cdt1 = value;
    notifyListeners();
  }

  void setCDT2(String value) {
    cdt2 = value;
    notifyListeners();
  }
}
