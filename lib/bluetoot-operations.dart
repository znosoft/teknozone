
import 'package:date_format/date_format.dart';
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
  static List<int> insertCardDayNightTime(String daytime, String nightTime) {
    final command = "1234SETAKT=$daytime${nightTime}aaaa";
    //final command = "1234SETAKT=00000000aaaa";
    print("COMMAND AKT: $command");
    return stringToHexArray(command);
  }

  static List<int> insertStartStopTime(String startTime, String stopTime) {
    final command = "1234SETCDT=$startTime${stopTime}aaaa";
    //final command = "1234SETCDT=11111111aaaa";
    print("COMMAND CDT: $command");
    return stringToDecArray(command);
  }

  static List<int> insertSystemTime(
      String hour, String miniute, String second) {
    final command = "1234SETTIM=$hour$miniute${second}aaaaaa";
    final hexArray = stringToHexArray(command);
    final decArray = stringToDecArray(command);
    print("Hex Array: $hexArray");
    print("Dec Array: $decArray");
    return stringToHexArray("1234SETTIM=$hour$miniute${second}aaaaaa");
  }

  static List<int> insertSystemDate(DateTime date) {
    var dateString = formatDate(date, ["dd", "mm", "yy"]);
    var command = "1234SETDAT=${dateString}aaaaaa";
    print("SystemDate: $command");
    return stringToHexArray(command);
  }

  static List<int> onOffDevice(bool isOn) {
    return stringToHexArray(
        (isOn ? "1234ON_OFF=111111aaaaaa" : "1234ON_OFF=000000aaaaaa"));
  }

  static List<int> setPPM(double value) {
    value = truncateDouble(value, 2);
    var valueInt = (value * 100).round();
    var command = "1234SETOSH=000${valueInt}0aaaaaaa";
    //var command = "1234SETOSH=00099aaaaaaa";
    print("PPM COMMAND: $command");
    return stringToDecArray(command);
  }

  static List<int> stringToDecArray(String input) {
    List<int> decimalArray = [];
    for (int i = 0; i < input.length; i++) {
      decimalArray.add(input.codeUnitAt(i));
    }
    return decimalArray;
  }

  static List<int> stringToHexArray(String input) {
    List<int> hexArray = [];
    for (int i = 0; i < input.length; i++) {
      hexArray.add(int.parse(input.codeUnitAt(i).toRadixString(16), radix: 16));
    }
    return hexArray;
  }

  static double truncateDouble(double val, int decimals) {
    String valString = val.toString();
    int dotIndex = valString.indexOf('.');

    // not enough decimals
    int totalDecimals = valString.length - dotIndex - 1;
    if (totalDecimals < decimals) {
      decimals = totalDecimals;
    }

    valString = valString.substring(0, dotIndex + decimals + 1);

    return double.parse(valString);
  }
}
