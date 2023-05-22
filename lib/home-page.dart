// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:teknozone/myModel.dart';
import 'package:teknozone/parser.dart';
import 'package:teknozone/settings.dart';
import 'package:teknozone/main.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.model}) : super(key: key);

  final MyModel model;
  double _currentSliderValue = 1;
  final cardWidth = 200.0;
  final cardHeight = 80.0;
  final Parser parser = Parser(
      "<00000,0289,041,SETOSH=|20,00,23,00,SETAKT=|10,60,20,60,SETCDT=|>");

  @override
  Widget build(BuildContext context) {
    print("MyModel-HomePage: ${model.akt1}");
    return Scaffold(
        backgroundColor: MyColors.grayColor,
        body: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomIconButton(
                            icon: 'assets/kırmızıbluut.png',
                            onPressed: () {
                              print("BT_ON");
                              //Connect - Disconnect Device
                              String readValue =
                                  "<00000,0289,041,SETOSH=|20,00,23,00,SETAKT=|10,60,20,60,SETCDT=|>";
                              //"ppm(5) / 1000 - SICAKLIK / 10 - NEM - 08,00,21,00 AKT - 15,05,15,03 CDT";
                            },
                          ),
                          HomePageCustomCard(
                            text: "",
                            widget: Slider(
                              value: _currentSliderValue,
                              max: 10,
                              divisions: 10,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomIconButton(
                            icon: 'assets/ozonn.png',
                            onPressed: () {
                              print("OZONE button clicked");
                            },
                          ),
                          HomePageCustomCard(text: "${model.ppm} ppm")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomIconButton(
                            icon: 'assets/tempp.png',
                            onPressed: () {
                              print("TEMP button clicked");
                            },
                          ),
                          HomePageCustomCard(text: "${model.temp} 'C")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomIconButton(
                              icon: 'assets/nemm.png',
                              onPressed: () {
                                print("TEMP button clicked");
                              }),
                          HomePageCustomCard(text: "${model.moisture} %Rh")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomIconButton(
                              icon: 'assets/sonfoto.png',
                              onPressed: () {
                                print("TEMP button clicked");
                                //Open Close Device
                              }),
                          HomePageCustomCard(
                            text: "",
                            widget: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: SizedBox(
                                child: Center(
                                  child: Row(children: [
                                    Image.asset(
                                      "assets/BT_TIME_AK.jpg",
                                      width: 100,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            model.akt1,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            model.akt2,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset("assets/BT_TIME_CD.jpg",
                                        width: 40),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            model.cdt1,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            model.cdt2,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class CustomIconButton extends StatelessWidget {
  final Color grayColor = MyColors.grayColor;
  CustomIconButton(
      {Key? key, required this.icon, this.onPressed, this.cardHeight})
      : super(key: key);
  final double? cardHeight;
  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    double height = cardHeight ?? 80.0;
    return SizedBox(
      height: height,
      width: height,
      child: IconButton(
        icon: Image.asset(icon),
        onPressed: onPressed,
      ),
    );
  }
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}

class HomePageCustomCard extends StatelessWidget {
  const HomePageCustomCard({Key? key, required this.text, this.widget})
      : super(key: key);
  final String text;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    Widget _widget = widget != null
        ? widget!
        : Text(
            text,
            style: TextStyle(color: Colors.white),
          );
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 200,
        height: 100,
        child: Center(
          child: _widget,
        ),
      ),
    );
  }
}

class MyColors {
  static Color grayColor = Color.fromARGB(255, 85, 85, 101);
}
