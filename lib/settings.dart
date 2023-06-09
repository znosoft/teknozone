import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:masked_text/masked_text.dart';
import 'package:teknozone/bluetoot-operations.dart';
import 'package:teknozone/myModel.dart';
import 'package:teknozone/parser.dart';
import 'home-page.dart';
import 'dart:io' show Platform;

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key, required this.model});
  final MyModel model;
  late DiscoveredDevice _ubiqueDevice;
  final flutterReactiveBle = FlutterReactiveBle();
  final Uuid serviceUuid = Platform.isAndroid
      ? Uuid.parse("0000FFE0-0000-1000-8000-00805F9B34FB")
      : Uuid.parse("FFE0");
  final Uuid characteristicUuid = Platform.isAndroid
      ? Uuid.parse("0000FFE1-0000-1000-8000-00805F9B34FB")
      : Uuid.parse("FFE1");
  final Guid serviceId = Guid("0000FFE0-0000-1000-8000-00805F9B34FB");
  final Guid characteristicGuid = Guid("0000FFE1-0000-1000-8000-00805F9B34FB");

  final Color grayColor = Color.fromARGB(255, 95, 93, 93);
  late Parser parser = Parser("");

  TextEditingController cdt1Controller = TextEditingController();
  TextEditingController cdt2Controller = TextEditingController();
  TextEditingController akt1Controller = TextEditingController();
  TextEditingController akt2Controller = TextEditingController();
  bool isScaning = false;
  //Save selected device
  void save() {}
  void _startScan() async {
    FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

    flutterBlue
        .startScan(withServices: [serviceId], timeout: Duration(seconds: 4));
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (var r in results) {
        print("R: $r");
        print("Device: ${r.device}");
        print('${r.device.name} found! rssi: ${r.rssi}');
        model.addDevice(r.device);
      }
    });
    flutterBlue.stopScan();

    /*
// Platform permissions handling stuff
    bool permGranted = false;
    model.setIsScanStarted(true);
    PermissionStatus permission;
    if (Platform.isAndroid) {
      permission = await LocationPermissions().requestPermissions();
      if (permission == PermissionStatus.granted) permGranted = true;
    } else if (Platform.isIOS) {
      permGranted = true;
    }
// Main scanning logic happens here ⤵️
    if (permGranted) {
      model.scanStarted(flutterReactiveBle
          .scanForDevices(withServices: [serviceUuid]).listen((device) {
        if (device.name == 'BT05') {
          model.setDiscoveredDevice(device);
          model.setIsDeviceFound(true);
          //_scanStream.cancel();
          // setState(() {
          //   _ubiqueDevice = device;
          //   _foundDeviceWaitingToConnect = true;
          // });
        }
      }));
    }
    */
  }

  void _connectToDevice() {
    if (model.isConnected) {
    } else {
      model.connectDevice();
    }

    /*
    print("ConnectTo Device: ${model.discoveredDevice.id}");
    model.scanStream.cancel();
    flutterReactiveBle.connectToAdvertisingDevice(
        id: model.discoveredDevice.id,
        prescanDuration: const Duration(seconds: 1),
        withServices: [serviceUuid]).listen((event) async {
      print("event: $event");
      switch (event.connectionState) {
        case DeviceConnectionState.connected:
          {
            print("Connected: ${event.deviceId}");
            model.rxCharacteristic = QualifiedCharacteristic(
                serviceId: serviceUuid,
                characteristicId: characteristicUuid,
                deviceId: event.deviceId);
            final response = await flutterReactiveBle
                .readCharacteristic(model.rxCharacteristic);

            print("Response: ${response.length} - $response");
            var _text = String.fromCharCodes(response);
            print("Response: $_text");
            /*
            */
            model.setIsDeviceFound(false);
            model.setIsConnected(true);
            // setState(() {
            //   _foundDeviceWaitingToConnect = false;
            //   _connected = true;
            // });
            const int maxSize = 65;
            String readText = "";
            bool updateScreen = true;
            flutterReactiveBle
                .subscribeToCharacteristic(model.rxCharacteristic)
                .listen((data) {
              readText += String.fromCharCodes(data);
              if (readText.length == maxSize) {
                print("Final Text: $readText");
                /*
                model.setAKT1(parser.getAKT1());
                model.setAKT2(parser.getAKT2());
                model.setCDT1(parser.getCDT1());
                model.setCDT2(parser.getCDT2());
                */
                if (updateScreen) {
                  parser = Parser(readText);
                  model.setValues(parser);
                  print("AKT1: ${model.akt1}");
                  akt1Controller.text = model.akt1;
                  akt2Controller.text = model.akt2;
                  cdt1Controller.text = model.cdt1;
                  cdt2Controller.text = model.cdt2;
                  updateScreen = false;
                  readText = "";
                }
              }
              print("Length ${data.length}");
              print("Data: $_text");
              // code to handle incoming data
            }, onError: (dynamic error) {
              // code to handle errors
            });
            break;
          }
        // Can add various state state updates on disconnect
        case DeviceConnectionState.disconnected:
          {
            break;
          }
        default:
      }
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    cdt1Controller.text = model.cdt1;
    cdt2Controller.text = model.cdt2;
    akt1Controller.text = model.akt1;
    akt2Controller.text = model.akt2;
    model.flutterReactiveBle = flutterReactiveBle;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 150),
        child: Container(
          color: MyColors.grayColor,
          child: Flex(direction: Axis.vertical, children: [
            SettingsBigCard(
              cdt1Controller: cdt1Controller,
              cdt2Controller: cdt2Controller,
              akt1Controller: akt1Controller,
              akt2Controller: akt2Controller,
            ),
            // CustomIconButton(
            //     icon: 'assets/PASS_CHANGE.jpg',
            //     onPressed: () {
            //       print("PASS CHANGE button clicked");
            //     }),
            SettingsButtonGroup1(
              cdt1Controller: cdt1Controller,
              cdt2Controller: cdt2Controller,
              akt1Controller: akt1Controller,
              akt2Controller: akt2Controller,
              model: model,
            ),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: model.deviceList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onLongPress: () => model.setSelectedIndex(index),
                        child: Container(
                          height: 50,
                          color: model.selectedIndex != null &&
                                  model.selectedIndex == index
                              ? Colors.amber[600]
                              : Colors.white,
                          child: Center(
                              child: Text(
                                  'Cihaz: ${model.deviceList[index].name}')),
                        ),
                      );
                    })),
            Row(
              children: [
                CustomIconButton(
                    icon: 'assets/BT_SCAN.jpg',
                    onPressed: () async {
                      print("PASS SCAN button clicked");
                      _startScan();
                      //await BlueToothOperations.scanBLE();
                    }),
                // CustomIconButton(
                //     icon: 'assets/BT_SAVE.jpg',
                //     onPressed: () {
                //       print("PASS CHANGE button clicked");
                //       save();
                //     }),
                // model.isDeviceFound
                //     ? CustomIconButton(
                //         icon: 'assets/BT_ON.jpg', onPressed: _connectToDevice)
                //     : CustomIconButton(
                //         icon: 'assets/BT_OFF.jpg', onPressed: () {}),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class SettingsButtonGroup1 extends StatelessWidget {
  const SettingsButtonGroup1(
      {super.key,
      required this.cdt1Controller,
      required this.cdt2Controller,
      required this.akt1Controller,
      required this.akt2Controller,
      required this.model});
  final TextEditingController cdt1Controller;
  final TextEditingController cdt2Controller;
  final TextEditingController akt1Controller;
  final TextEditingController akt2Controller;
  final MyModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // CustomIconButton(
        //     cardHeight: 60,
        //     icon: 'assets/PASS_Check.jpg',
        //     onPressed: () {
        //       print("PASS CHECK button clicked");
        //       BlueToothOperations.togglePasswordRequired();
        //     }),
        // Card(color: Colors.black, child: SizedBox(width: 20, height: 20)),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_AP.jpg',
            onPressed: () {
              String dayTime = akt1Controller.text.replaceAll(RegExp(r':'), '');
              String nightTime =
                  akt2Controller.text.replaceAll(RegExp(r':'), '');
              var command = BlueToothOperations.insertCardDayNightTime(
                  dayTime, nightTime);
              model.writeCharacteristic(command);
              //model.flutterReactiveBle.writeCharacteristicWithoutResponse(model.rxCharacteristic,value: command);
              print("SAVE AP button clicked");
            }),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_CD.jpg',
            onPressed: () {
              String startTime =
                  cdt1Controller.text.replaceAll(RegExp(r':'), '');
              String stopTime =
                  cdt2Controller.text.replaceAll(RegExp(r':'), '');
              var command =
                  BlueToothOperations.insertStartStopTime(startTime, stopTime);
              //model.flutterReactiveBle.writeCharacteristicWithoutResponse(model.rxCharacteristic, value: command);
              model.writeCharacteristic(command);
              print("SAVE CD button clicked $startTime : $stopTime");
            }),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_TIME.jpg',
            onPressed: () {
              var dt = DateTime.now();
              String hour = dt.hour.toString();
              String miniute = dt.minute.toString();
              String second = dt.second.toString();
              var command =
                  BlueToothOperations.insertSystemTime(hour, miniute, second);
              model.writeCharacteristic(command);
              //model.flutterReactiveBle.writeCharacteristicWithoutResponse(model.rxCharacteristic,value: command);
              print(
                  "SystemTime: ${BlueToothOperations.insertSystemTime(hour, miniute, second)}");
              ;
              print("SAVE TIME button clicked");
            }),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_DATE.jpg',
            onPressed: () {
              var command =
                  BlueToothOperations.insertSystemDate(DateTime.now());
              model.writeCharacteristic(command);
              //model.flutterReactiveBle.writeCharacteristicWithoutResponse(model.rxCharacteristic,value: command);
              print("SAVE DATE button clicked");
            }),
      ],
    );
  }
}

class SettingsBigCard extends StatelessWidget {
  const SettingsBigCard(
      {super.key,
      required this.cdt1Controller,
      required this.cdt2Controller,
      required this.akt1Controller,
      required this.akt2Controller});
  final TextEditingController cdt1Controller;
  final TextEditingController cdt2Controller;
  final TextEditingController akt1Controller;
  final TextEditingController akt2Controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
        child: SizedBox(
          child: Center(
            child: Row(children: [
              Image.asset(
                "assets/BT_TIME_AK.jpg",
                width: 40,
              ),
              Expanded(
                child: Column(
                  children: [
                    MaskedTextField(
                      controller: akt1Controller,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      mask: "##:##",
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                    MaskedTextField(
                      controller: akt2Controller,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      mask: "##:##",
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ],
                ),
              ),
              Image.asset("assets/BT_TIME_CD.jpg", width: 40),
              Expanded(
                child: Column(
                  children: [
                    MaskedTextField(
                      controller: cdt1Controller,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      mask: "##:##",
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                    MaskedTextField(
                      controller: cdt2Controller,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      mask: "##:##",
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
