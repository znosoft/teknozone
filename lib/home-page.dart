import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Row(children: [
        IconButton(
          icon: Image.asset('assets/BT_OFF.jpg'),
          iconSize: 10,
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset('assets/BT_ON.jpg'),
          iconSize: 10,
          onPressed: () {},
        )
      ]),
      Row(
        children: [
          IconButton(
            icon: Image.asset('assets/OZONE.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: Image.asset('assets/TEMP.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: Image.asset('assets/NEM.jpg'),
            iconSize: 50,
            onPressed: () {},
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: Image.asset('assets/BT_TIME_OFF.jpg'),
            iconSize: 10,
            onPressed: () {},
          ),
        ],
      ),
    ]));
  }
}
