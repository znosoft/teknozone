// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
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
      )
    ]));
  }
}
