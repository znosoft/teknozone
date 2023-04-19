import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              background: Colors.black, seedColor: Colors.black),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constransts) {
      return Scaffold(
          backgroundColor: Color.fromARGB(255, 95, 93, 93),
          appBar: AppBar(
            title: Text("TEKNOZONE"),
          ),
          body: Column(children: [
            Row(children: [
              IconButton(
                icon: Image.asset('assets/BT_OFF.jpg'),
                iconSize: 50,
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('assets/BT_ON.jpg'),
                iconSize: 50,
                onPressed: () {},
              )
            ]),
            Row(
              children: [
                IconButton(
                  icon: Image.asset('assets/OZONE.jpg'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Image.asset('assets/TEMP.jpg'),
                  iconSize: 50,
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
                  iconSize: 50,
                  onPressed: () {},
                ),
              ],
            ),
          ]));
    });
  }
}
