import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:request_permission/request_permission.dart';
import 'package:string_to_hex/string_to_hex.dart';

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
  static List<int> insertCardDayNightTime(String daytime, String nightTime) {
    return convertToAscii("1234SETAKT=$daytime${nightTime}aaaa");
  }

  static List<int> insertStartStopTime(String startTime, String stopTime) {
    return convertToAscii("1234SETCDT=$startTime${stopTime}aaaa");
  }

  static List<int> insertSystemTime(
      String hour, String miniute, String second) {
    return convertToAscii("1234SETTIM=$hour$miniute${second}aaaaaa");
  }

  static List<int> insertSystemDate(DateTime date) {
    var dateString = formatDate(date, ["dd", "mm", "yy"]);
    // var x = "1234SETDAT=${dateString}aaaaaa";
    var x = "1234SETDAT=010130aaaaaa";
    print("SystemDate: $x");
    return convertToAscii(x);
  }

  static List<int> onOffDevice(bool isOn) {
    return convertToAscii(
        (isOn ? "1234ON_OFF=111111aaaaaa" : "1234ON_OFF=000000aaaaaa"));
  }

  static List<int> convertToAscii(String text) {
    //var x = StringToHex.toHexString(text);
    //print("Encode: $x");
    return utf8.encode(text);
    /*
    List<int> retList = [];
    for (int i = 0; i < text.length; i++) {
      retList.add( text.codeUnitAt(i));
    }
    return retList;
    */
  }
}
