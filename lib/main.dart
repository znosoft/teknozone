import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teknozone/contact-us-page.dart';
import 'package:teknozone/home-page.dart';
import 'package:teknozone/myModel.dart';
import 'package:teknozone/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: MaterialApp(
        title: 'Teknozone',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              background: MyColors.grayColor, seedColor: MyColors.grayColor),
        ),
        //home: MyHomePage(),
        home: FutureBuilder(
            //future: FlutterBluePlus.instance.isAvailable,
            //future: FlutterBluetoothSerial.instance.requestEnable(),
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
                    Consumer<MyModel>(builder: (context, model, child) {
                      print("Model-HomePage: ${model.akt1}");
                      return HomePage(model: model);
                    }),
                    Consumer<MyModel>(builder: (context, model, child) {
                      print("Model-SettingsPage: ${model.akt1}");
                      return SettingsPage(model: model);
                    }),
                    Consumer(builder: (context, model, child) {
                      return ContactUsPage();
                    })
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
        }),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}
