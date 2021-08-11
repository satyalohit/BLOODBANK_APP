import 'package:bloodbank/screens/donorscreen.dart';
import 'package:bloodbank/screens/homescreen.dart';
import 'package:bloodbank/screens/recieverscreen.dart';
import 'package:bloodbank/screens/tabscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BLOODBANK",
      theme: ThemeData(
        accentColor: Colors.redAccent,
        primaryColor: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Tabscreen(),
        DonateScreen.routename: (ctx) => DonateScreen(),
        Homescreen.routename: (ctx) => Homescreen(),
        RecieverScreen.routename: (ctx) => RecieverScreen()
      },
    );
  }
}
