// ignore_for_file: file_names
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentSliderValue = 1;
  final cardWidth = 200.0;

  final cardHeight = 80.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.grayColor,
        body: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomIconButton(
                            icon: 'assets/BT_OFF.jpg',
                            onPressed: () {
                              print("BT_ON");
                              //Connect - Disconnect Device
                              String readValue =
                                  "<00000,0289,041,SETOSH=|08,00,21,00,SETAKT=|15,05,15,03,SETCDT=|>";
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
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
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
                            icon: 'assets/OZONE.jpg',
                            onPressed: () {
                              print("OZONE button clicked");
                            },
                          ),
                          HomePageCustomCard(text: "--.--ppm")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomIconButton(
                            icon: 'assets/TEMP.jpg',
                            onPressed: () {
                              print("TEMP button clicked");
                            },
                          ),
                          HomePageCustomCard(text: "--.- 'C")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomIconButton(
                              icon: 'assets/NEM.jpg',
                              onPressed: () {
                                print("TEMP button clicked");
                              }),
                          HomePageCustomCard(text: "--.- %Rh")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          CustomIconButton(
                              icon: 'assets/BT_TIME_OFF.jpg',
                              onPressed: () {
                                print("TEMP button clicked");
                                //Open Close Device
                              }),
                          HomePageCustomCard(text: "--.- 'C")
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
        height: 80,
        child: Center(
          child: _widget,
        ),
      ),
    );
  }
}

class MyColors {
  static Color grayColor = Color.fromARGB(255, 95, 93, 93);
}
