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
  static void insertCardDayNightTime(String daytime, String nightTime) {
    String komut = "1234SETAKT=$daytime${nightTime}aaaa";
    insert(komut);
  }

  static void insertStartStopTime(String startTime, String stopTime) {
    String komut = "1234SETCDT=$startTime${stopTime}aaaa";
    insert(komut);
  }

  static void insertSystemTime(String hour, String miniute, String second) {
    String komut = "1234SETTIM=$hour$miniute${second}aaaaaa";
    insert(komut);
  }

  static void insertSystemDate(String day, String month, String year) {
    String komut = "1234SETDAT=$day$month${year}aaaaaa";
    insert(komut);
  }

  static void onOffDevice(bool isOn) {
    String komut =
        (isOn ? "1234ON_OFF=111111aaaaaa" : "1234ON_OFF=000000aaaaaa");
    insert(komut);
  }

  static void insert(String komut) {}
}
