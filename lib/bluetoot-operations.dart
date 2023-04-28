import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BlueToothOperations {
  static void scanBLE() {
    var _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      // setState(() {
      //   final existingIndex = results.indexWhere(
      //       (element) => element.device.address == r.device.address);
      //   if (existingIndex >= 0)
      //     results[existingIndex] = r;
      //   else
      //     results.add(r);
      // });
    });
  }

  //Toggle passwordRequired
  static void togglePasswordRequired() {}
  static void insertCardDayNightTime() {
    String komut = "1234SETAKT=20002300aaaa";
    insert(komut);
  }

  static void insertStartStopTime() {
    String komut = "1234SETCDT=10602060aaaa";
    insert(komut);
  }

  static void insertSystemTime() {
    String komut = "1234SETTIM=HHMMSSaaaaaa";
    insert(komut);
  }

  static void insertSystemDate() {
    String komut = "1234SETDAT=DDMMYYaaaaaa";
    insert(komut);
  }

  static void onOffDevice(bool isOn) {
    String komut =
        (isOn ? "1234ON_OFF=111111aaaaaa" : "1234ON_OFF=000000aaaaaa");
    insert(komut);
  }

  static void insert(String komut) {}
}
