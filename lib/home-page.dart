// ignore_for_file: file_names
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
                            },
                          ),
                          HomePageCustomCard(text: "PPM SET: --.--ppm")
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

class HomePageCustomCard extends StatelessWidget {
  const HomePageCustomCard({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 200,
        height: 80,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MyColors {
  static Color grayColor = Color.fromARGB(255, 95, 93, 93);
}
