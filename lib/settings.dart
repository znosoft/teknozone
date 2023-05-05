import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:teknozone/bluetoot-operations.dart';
import 'package:teknozone/parser.dart';
import 'home-page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  final Color grayColor = Color.fromARGB(255, 95, 93, 93);
  bool isScaning = false;
  List<BluetoothDiscoveryResult> results =
      List<BluetoothDiscoveryResult>.empty(growable: true);

  //Save selected device
  void save() {}

  @override
  Widget build(BuildContext context) {
    TextEditingController cdt1Controller = TextEditingController();
    TextEditingController cdt2Controller = TextEditingController();
    return Flexible(
        child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 150),
      child: Container(
        color: MyColors.grayColor,
        child: Flex(direction: Axis.vertical, children: [
          SettingsBigCard(
            cdt1Controller: cdt1Controller,
            cdt2Controller: cdt2Controller,
          ),
          CustomIconButton(
              icon: 'assets/PASS_CHANGE.jpg',
              onPressed: () {
                print("PASS CHANGE button clicked");
              }),
          SettingsButtonGroup1(
              cdt1Controller: cdt1Controller, cdt2Controller: cdt2Controller),
          Expanded(
            child: Container(
              color: Colors.yellow,
              height: 120,
            ),
          ),
          Row(
            children: [
              CustomIconButton(
                  icon: 'assets/BT_SCAN.jpg',
                  onPressed: () {
                    print("PASS SCAN button clicked");
                    BlueToothOperations.scanBLE();
                  }),
              CustomIconButton(
                  icon: 'assets/BT_SAVE.jpg',
                  onPressed: () {
                    print("PASS CHANGE button clicked");
                    save();
                  }),
            ],
          ),
        ]),
      ),
    ));
  }
}

class SettingsButtonGroup1 extends StatelessWidget {
  const SettingsButtonGroup1(
      {super.key, required this.cdt1Controller, required this.cdt2Controller});
  final TextEditingController cdt1Controller;
  final TextEditingController cdt2Controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/PASS_Check.jpg',
            onPressed: () {
              print("PASS CHANGE button clicked");
              BlueToothOperations.togglePasswordRequired();
            }),
        Card(color: Colors.black, child: SizedBox(width: 20, height: 20)),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_AP.jpg',
            onPressed: () {
              String dayTime = "";
              String nightTime = "";
              BlueToothOperations.insertCardDayNightTime(dayTime, nightTime);
              print("PASS CHANGE button clicked");
            }),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_CD.jpg',
            onPressed: () {
              String startTime = cdt1Controller.text;
              String stopTime = cdt2Controller.text;
              BlueToothOperations.insertStartStopTime(startTime, stopTime);
              print("BT_SAVE_CD button clicked $startTime : $stopTime");
            }),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_TIME.jpg',
            onPressed: () {
              String hour = "";
              String miniute = "";
              String second = "";
              BlueToothOperations.insertSystemTime(hour, miniute, second);
              print("PASS CHANGE button clicked");
            }),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_DATE.jpg',
            onPressed: () {
              String day = "";
              String month = "";
              String year = "";
              BlueToothOperations.insertSystemDate(day, month, year);
              print("PASS CHANGE button clicked");
            }),
      ],
    );
  }
}

class SettingsBigCard extends StatelessWidget {
  const SettingsBigCard(
      {super.key, required this.cdt1Controller, required this.cdt2Controller});
  final TextEditingController cdt1Controller;
  final TextEditingController cdt2Controller;

  @override
  Widget build(BuildContext context) {
    final Parser parser = Parser(
        "<00000,0289,041,SETOSH=|20,00,23,00,SETAKT=|10,60,20,60,SETCDT=|>");
    cdt1Controller.text = parser.getCDT1();
    cdt1Controller.addListener(() {});
    cdt2Controller.text = parser.getCDT2();
    cdt2Controller.addListener(() {});
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
                    Text(
                      parser.getAKT1(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      parser.getAKT2(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Image.asset("assets/BT_TIME_CD.jpg", width: 40),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: cdt1Controller,
                      style: TextStyle(color: Colors.white),
                    ),
                    TextField(
                      controller: cdt2Controller,
                      style: TextStyle(color: Colors.white),
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
