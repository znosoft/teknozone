// ignore_for_file: file_names
import 'package:flutter/material.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('İletişim', style: _style),
            Text('Teknozone Ozon Sistemleri ', style: _style),
            Text('Merkez: ', style: _style),
            Text(
                'Kazım Karabekir Mh. Bekir Saydam cd. No:104 A3 blok P/13(Çetmen Organize Sanayi Sitesi) Pancar-Torbalı İzmir ',
                style: _style),
            SelectableText('(0232) 472 11 35 ', style: _style),
            SelectableText('(0232) 472 11 18 ', style: _style),
            SelectableText('info@teknozone.com.tr ', style: _style),
            SelectableText('www.ozonjeneratoru.com ', style: _style),
          ],
        ));
  }
}
