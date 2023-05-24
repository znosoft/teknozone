// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';
import 'package:teknozone/bluetoot-operations.dart';
import 'package:teknozone/myModel.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.model}) : super(key: key);

  final MyModel model;
  final cardWidth = 200.0;
  final cardHeight = 80.0;
  TextEditingController cdt1Controller = TextEditingController();
  TextEditingController cdt2Controller = TextEditingController();
  TextEditingController akt1Controller = TextEditingController();
  TextEditingController akt2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("MyModel-HomePage: ${model.akt1}");
    cdt1Controller.text = model.cdt1;
    cdt2Controller.text = model.cdt2;
    akt1Controller.text = model.akt1;
    akt2Controller.text = model.akt2;
    Timer ppmTimer = Timer(Duration.zero, () {});
    return Scaffold(
        backgroundColor: MyColors.grayColor,
        body: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: [
                          model.isConnected
                              ? CustomIconButton(
                                  icon: 'assets/BT_ON.jpg',
                                  onPressed: () {
                                    print("BT_ON");
                                    model.disConnect();
                                  },
                                )
                              : model.isConnecting
                                  ? CustomIconButton(
                                      icon: 'assets/BT_CON.jpg',
                                      onPressed: () {
                                        print("BT_ON");
                                        model.connectDevice();
                                      })
                                  : CustomIconButton(
                                      icon: 'assets/kırmızıbluut.png',
                                      onPressed: () {
                                        print("BT_ON");
                                        model.connectDevice();
                                      },
                                    ),
                          GestureDetector(
                            onDoubleTap: () {
                              if (model.isSetPPMEnabled) {
                                var command = BlueToothOperations.setPPM(
                                    model.ppmSetting);
                                print("Set PPM: $command");
                                model.writeCharacteristic(command);
                                model.setIsSetPPMEnabled(false);
                              } else {
                                model.setIsSetPPMEnabled(true);
                              }
                            },
                            child: HomePageCustomCard(
                                text: "",
                                widget: Slider(
                                  value: model.ppmSetting,
                                  max: 0.09,
                                  divisions: 10,
                                  label: model.ppmSetting.toString(),
                                  onChanged: (value) {
                                    value = BlueToothOperations.truncateDouble(
                                        value, 2);
                                    if (model.isSetPPMEnabled) {
                                      model.setPPMSetting(value);
                                    }
                                  },
                                )
                                //SliderExample(model: model),
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
                          GestureDetector(
                              onTap: () {
                                if (model.isSetPPMEnabled) {
                                  var command = BlueToothOperations.setPPM(
                                      model.ppmSetting);
                                  print("Set PPM: $command");
                                  model.writeCharacteristic(command);
                                  model.setIsSetPPMEnabled(false);
                                } else {
                                  model.setIsSetPPMEnabled(true);
                                }
                              },
                              child:
                                  HomePageCustomCard(text: "${model.ppm} ppm"))
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
                              icon: model.isOn
                                  ? 'assets/BT_TIME_ON.jpg'
                                  : 'assets/BT_TIME_OFF.jpg',
                              onPressed: () {
                                print("ON_OFF button clicked");
                                var command = BlueToothOperations.onOffDevice(
                                    !model.isOn);
                                model.writeCharacteristic(command);
                                model.setIsOn(!model.isOn);
                              }),
                          HomePageCustomCard(
                            text: "",
                            widget: SizedBox(
                              child: Center(
                                child: Row(children: [
                                  Image.asset(
                                    "assets/BT_TIME_AK.jpg",
                                    height: 60,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          akt1Controller.text,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          akt2Controller.text,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset("assets/BT_TIME_CD.jpg",
                                      height: 60),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cdt1Controller.text,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          cdt2Controller.text,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
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
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: 140,
        height: 60,
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
