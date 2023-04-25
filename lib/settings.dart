import 'package:flutter/material.dart';

import 'home-page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  final Color grayColor = Color.fromARGB(255, 95, 93, 93);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayColor,
      body: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.all(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SettingsBigCard(),
            CustomIconButton(
                icon: 'assets/PASS_CHANGE.jpg',
                onPressed: () {
                  print("PASS CHANGE button clicked");
                }),
            Row(
              children: [
                CustomIconButton(
                    cardHeight: 60,
                    icon: 'assets/PASS_Check.jpg',
                    onPressed: () {
                      print("PASS CHANGE button clicked");
                    }),
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
            ),
            Container(
              color: Colors.yellow,
              width: 200,
              height: 120,
            ),
            Row(
              children: [
                CustomIconButton(
                    icon: 'assets/BT_SCAN.jpg',
                    onPressed: () {
                      print("PASS CHANGE button clicked");
                    }),
                CustomIconButton(
                    icon: 'assets/BT_SAVE.jpg',
                    onPressed: () {
                      print("PASS CHANGE button clicked");
                    }),
              ],
            ),
          ]),
        )
      ]),
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
              SizedBox(width: 20),
              Column(
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
              SizedBox(width: 20),
              Image.asset("assets/BT_TIME_CD.jpg", width: 40),
              SizedBox(width: 20),
              Column(
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
              SizedBox(width: 20),
            ]),
          ),
        ),
      ),
    );
  }
}
