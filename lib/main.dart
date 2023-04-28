import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';
import 'package:teknozone/contact-us-page.dart';
import 'package:teknozone/home-page.dart';
import 'package:teknozone/settings.dart';

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
          title: 'Teknozone',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                background: Colors.black, seedColor: Colors.black),
          ),
          //home: MyHomePage(),
          home: FutureBuilder(
              future: FlutterBluetoothSerial.instance.requestEnable(),
              builder: (context, future) {
                if (future.connectionState != ConnectionState.waiting) {
                  return DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Color.fromARGB(255, 95, 93, 93),
                        bottom: TabBar(
                          tabs: [
                            Tab(icon: Image.asset('assets/OLCUMLER.jpg')),
                            Tab(icon: Image.asset('assets/SETTING.jpg')),
                            Tab(icon: Image.asset('assets/HAKKINDA.jpg')),
                          ],
                        ),
                        title: Center(
                            child: Image.asset(
                          "assets/Teknozone.jpg",
                          scale: 0.6,
                          height: 30,
                        )),
                      ),
                      body: TabBarView(
                        children: [
                          HomePage(),
                          SettingsPage(),
                          ContactUsPage(),
                          //Icon(Icons.directions_bike),
                        ],
                      ),
                    ),
                  );
                }
                return Scaffold(
                  body: Container(
                    height: double.infinity,
                    child: Center(
                        child: Icon(
                      Icons.bluetooth_disabled,
                      size: 20,
                      color: Colors.blue,
                    )),
                  ),
                );
              })),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(primarySwatch: Brightness.dark),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 95, 93, 93),
            bottom: TabBar(
              tabs: [
                Tab(icon: Image.asset('assets/OLCUMLER.jpg')),
                Tab(icon: Image.asset('assets/SETTING.jpg')),
                Tab(icon: Image.asset('assets/HAKKINDA.jpg')),
              ],
            ),
            title: Center(
                child: Image.asset(
              "assets/Teknozone.jpg",
              scale: 0.6,
              height: 30,
            )),
          ),
          body: TabBarView(
            children: [
              HomePage(),
              SettingsPage(),
              ContactUsPage(),
              //Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
    /*
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 95, 93, 93),
        appBar: AppBar(
          title: Text("TEKNOZONE"),
        ),
        body: HomePage());
      */
  }
}
