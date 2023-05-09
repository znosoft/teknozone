import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:request_permission/request_permission.dart';

class BlueToothOperations {
  static void scanWithUUID() {
    final flutterReactiveBle = FlutterReactiveBle();
    flutterReactiveBle.scanForDevices(withServices: [
      Uuid.parse("0000FFE0-0000-1000-8000-00805F9B34FB")
    ]).listen((device) {
      print("Device: $device");
      //code for handling results
    }, onDone: () {
      print("Done");
    }, onError: (error) {
      print("Error: $error");
      //code for handling error
    });
  }

  static Future<void> scanBLE() async {
    //scanWithUUID();
    var requiredPermissions = {
      "android.permission.BLUETOOTH_SCAN",
      "android.permission.BLUETOOTH_CONNECT"
    };
    var stateList = await RequestPermission.instace
        .hasAndroidPermissions(requiredPermissions);
    var isAnyTrue = stateList.values.toList().any((element) => element == true);
    print("isAnyTrue: $isAnyTrue");
    if (isAnyTrue) {
      scanWithUUID();
    } else {
      RequestPermission.instace.results.listen((event) {
        event.grantedPermissions.forEach((permission, isGranted) {
          print("Permission - $permission: $isGranted");
          if (permission == "android.permission.BLUETOOTH_SCAN" && isGranted) {
            scanWithUUID();
          }
        });
      });
      RequestPermission.instace
          .requestMultipleAndroidPermissions(requiredPermissions, 101);
    }
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
