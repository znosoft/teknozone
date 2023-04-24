import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Row(
        children: [
          IconButton(
            icon: Image.asset('assets/BT_TIME_AK.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/BT_TIME_CD.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: Image.asset('assets/PASS_CHANGE.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: Image.asset('assets/PASS_Check.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/BT_SAVE_AP.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/BT_SAVE_CD.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/BT_SAVE_TIME.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/BT_SAVE_DATE.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
        ],
      ),
      Row(children: [
        IconButton(
          icon: Image.asset('assets/BT_SCAN.jpg'),
          iconSize: 10,
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset('assets/BT_SAVE.jpg'),
          iconSize: 10,
          onPressed: () {},
        ),
      ]),
    ]));
  }
}
