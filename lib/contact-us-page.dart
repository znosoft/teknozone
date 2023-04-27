// ignore_for_file: file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:teknozone/home-page.dart';

class ContactUsPage extends StatelessWidget {
  final TextStyle _style = TextStyle(
    wordSpacing: 2,
    letterSpacing: 2,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.grayColor,
        body: Card(
          color: MyColors.grayColor,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/Teknozone Logo Buyuk.jpg',
                      width: 40,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text('İletişim', style: _style)),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Teknozone Ozon Sistemleri ', style: _style)),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Merkez: ', style: _style)),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Kazım Karabekir Mh. Bekir Saydam cd. No:104 A3 blok P/13(Çetmen Organize Sanayi Sitesi) Pancar-Torbalı İzmir ',
                        style: _style)),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.topLeft,
                    child: SelectableText('(0232) 472 11 35 ', style: _style)),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.topLeft,
                    child: SelectableText('(0232) 472 11 18 ', style: _style)),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.topLeft,
                    child: SelectableText('info@teknozone.com.tr ',
                        style: _style)),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.topLeft,
                    child: SelectableText('www.ozonjeneratoru.com ',
                        style: _style)),
                Padding(
                  padding: const EdgeInsets.all(60),
                  child: CustomIconButton(
                    icon: 'assets/BT_CALL.jpg',
                    onPressed: () {
                      print("TEMP button clicked");
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
