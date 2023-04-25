// ignore_for_file: file_names
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Ink(
                height: 80,
                width: 80,
                decoration: ShapeDecoration(
                    color: Color.fromARGB(255, 95, 93, 93),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                child: IconButton(
                  icon: Image.asset('assets/BT_OFF.jpg'),
                  iconSize: 10,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10),
              Ink(
                height: 80,
                width: 80,
                decoration: ShapeDecoration(
                    color: Color.fromARGB(255, 95, 93, 93),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                child: IconButton(
                  icon: Image.asset('assets/OZONE.jpg'),
                  iconSize: 20,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10),
              Ink(
                height: 80,
                width: 80,
                decoration: ShapeDecoration(
                    color: Color.fromARGB(255, 95, 93, 93),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                child: IconButton(
                  icon: Image.asset('assets/TEMP.jpg'),
                  iconSize: 10,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10),
              Ink(
                height: 80,
                width: 80,
                decoration: ShapeDecoration(
                    color: Color.fromARGB(255, 95, 93, 93),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                child: IconButton(
                  icon: Image.asset('assets/NEM.jpg'),
                  iconSize: 10,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10),
              Ink(
                height: 80,
                width: 80,
                decoration: ShapeDecoration(
                    color: Color.fromARGB(255, 95, 93, 93),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                child: IconButton(
                  icon: Image.asset('assets/BT_TIME_OFF.jpg'),
                  iconSize: 10,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 80,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "PPM SET: --.--ppm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 200,
                height: 80,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "--.--ppm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Ink(
                width: 200,
                height: 80,
                padding: EdgeInsets.all(8),
                decoration: ShapeDecoration(
                    color: Color.fromARGB(255, 95, 93, 93),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
                child: Center(
                  child: Text(
                    "--.- 'C",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
    // return Scaffold(
    //     body: Column(children: [
    //   Row(children: [
    //     IconButton(
    //       icon: Image.asset('assets/BT_OFF.jpg'),
    //       iconSize: 10,
    //       onPressed: () {},
    //     ),
    //     IconButton(
    //       icon: Image.asset('assets/BT_ON.jpg'),
    //       iconSize: 10,
    //       onPressed: () {},
    //     )
    //   ]),
    //   Row(
    //     children: [
    //       IconButton(
    //         icon: Image.asset('assets/OZONE.jpg'),
    //         iconSize: 10,
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    //   Row(
    //     children: [
    //       IconButton(
    //         icon: Image.asset('assets/TEMP.jpg'),
    //         iconSize: 10,
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    //   Row(
    //     children: [
    //       IconButton(
    //         icon: Image.asset('assets/NEM.jpg'),
    //         iconSize: 10,
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    //   Row(
    //     children: [
    //       IconButton(
    //         icon: Image.asset('assets/BT_TIME_OFF.jpg'),
    //         iconSize: 10,
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    // ]));
  }
}
