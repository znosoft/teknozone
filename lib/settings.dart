import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:teknozone/bluetoot-operations.dart';

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
    return Flexible(
        child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 150),
      child: Container(
        color: MyColors.grayColor,
        child: Flex(direction: Axis.vertical, children: [
          SettingsBigCard(),
          CustomIconButton(
              icon: 'assets/PASS_CHANGE.jpg',
              onPressed: () {
                print("PASS CHANGE button clicked");
              }),
          SettingsButtonGroup1(),
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
  const SettingsButtonGroup1({
    super.key,
  });

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
              print("PASS CHANGE button clicked");
            }),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_CD.jpg',
            onPressed: () {
              print("PASS CHANGE button clicked");
            }),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_TIME.jpg',
            onPressed: () {
              print("PASS CHANGE button clicked");
            }),
        CustomIconButton(
            cardHeight: 60,
            icon: 'assets/BT_SAVE_DATE.jpg',
            onPressed: () {
              print("PASS CHANGE button clicked");
            }),
      ],
    );
  }
}

class SettingsBigCard extends StatelessWidget {
  const SettingsBigCard({
    super.key,
  });

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
                    Text(
                      "--:--",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "--:--",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Image.asset("assets/BT_TIME_CD.jpg", width: 40),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "--:--",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "--:--",
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
