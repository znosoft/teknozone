import 'dart:async';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:teknozone/parser.dart';

class MyModel extends ChangeNotifier {
  bool updateView = true;
  final Guid serviceId = Guid("0000FFE0-0000-1000-8000-00805F9B34FB");
  final Guid characteristicGuid = Guid("0000FFE1-0000-1000-8000-00805F9B34FB");
  int? selectedIndex;
  List<BluetoothDevice> deviceList = [];
  late StreamSubscription<DiscoveredDevice> scanStream;
  late FlutterReactiveBle flutterReactiveBle;
  late QualifiedCharacteristic rxCharacteristic;
  bool isScanStarted = false;
  bool isDeviceFound = false;
  bool isConnecting = false;
  bool isConnected = false;
  late DiscoveredDevice discoveredDevice;
  String akt1 = "";
  String akt2 = "";
  String cdt1 = "";
  String cdt2 = "";
  double ppm = 0;
  double ppmSetting = 0;
  double temp = 0;
  int moisture = 0;
  bool isSetPPMEnabled = false;
  bool isOn = true;

  late BluetoothService service;
  late BluetoothCharacteristic? characteristic;
  void addCharacteristic(BluetoothCharacteristic value) {
    const int maxSize = 65;
    String readText = "";
    characteristic = value;
    characteristic!.setNotifyValue(true);
    characteristic!.value.listen((value) {
      if (updateView) {
        readText += String.fromCharCodes(value);
        if (readText.length == maxSize) {
          setValues(readText);
          changeUpdateView(false);
          print("Read: $readText");
          readText = "";
        }
      }
      //print("Read: $value");
    });
    //notifyListeners();
  }

  void writeCharacteristic(List<int> value) {
    if (characteristic != null) {
      characteristic!.write(value);
      updateView = true;
    }
  }

  void addServices(BluetoothService value) {
    isConnected = true;
    notifyListeners();
    service = value;
    // Reads all characteristics
    var characteristics = service.characteristics;
    for (BluetoothCharacteristic c in characteristics) {
      if (c.uuid == characteristicGuid) {
        addCharacteristic(c);
      }
    }
    //notifyListeners();
  }

  BluetoothDevice? connectDevice() {
    if (selectedIndex == null) return null;
    isConnecting = true;
    isConnected = false;
    var _device = deviceList[selectedIndex!];
    _device.connect().then((value) {
      _device.discoverServices().then((value) async {
        for (var _service in value) {
          if (_service.uuid == serviceId) {
            addServices(_service);
          }
        }
      });
    });
    notifyListeners();
  }

  void disConnect() {
    isConnected = false;
    isConnecting = false;
    if (selectedIndex == null) return null;
    var _device = deviceList[selectedIndex!];
    if (_device != null) {
      _device.disconnect();
      isDeviceFound = true;
    }
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    selectedIndex = index;
    isDeviceFound = true;
    notifyListeners();
  }

  void addDevice(BluetoothDevice device) {
    if (!deviceList.any((element) => element.id == device.id)) {
      deviceList.add(device);
      notifyListeners();
    }
  }

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

  void setValues(String value) {
    Parser parser = Parser(value);
    if (akt1 != parser.getAKT1()) setAKT1(parser.getAKT1());
    if (akt2 != parser.getAKT2()) setAKT2(parser.getAKT2());
    if (cdt1 != parser.getCDT1()) setCDT1(parser.getCDT1());
    if (cdt2 != parser.getCDT2()) setCDT2(parser.getCDT2());
    if (temp != parser.getTemp()) setTemp(parser.getTemp());
    if (ppm != parser.getPPM()) setPPM(parser.getPPM());
    if (moisture != parser.getMoisture()) setMoisture(parser.getMoisture());
    if (updateView) notifyListeners();
  }

  void setAKT1(String value) {
    akt1 = value;
    updateView = true;
    notifyListeners();
  }

  void setAKT2(String value) {
    akt2 = value;
    updateView = true;
    notifyListeners();
  }

  void setCDT1(String value) {
    cdt1 = value;
    updateView = true;
    notifyListeners();
  }

  void setCDT2(String value) {
    cdt2 = value;
    updateView = true;
    notifyListeners();
  }

  void setTemp(double value) {
    temp = temp;
    notifyListeners();
  }

  void setMoisture(int value) {
    moisture = value;
    notifyListeners();
  }

  void setPPM(double value) {
    ppm = value;
    notifyListeners();
  }

  void setPPMSetting(double value) {
    ppmSetting = value;
    notifyListeners();
  }

  void changeUpdateView(bool value) {
    updateView = value;
    notifyListeners();
  }

  void setIsSetPPMEnabled(bool value) {
    isSetPPMEnabled = value;
    notifyListeners();
  }

  void setIsOn(bool value) {
    isOn = value;
    notifyListeners();
  }
}
