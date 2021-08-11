import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  static const routename = '/homescreen';

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Image.asset("assets/images/blood-donation.jpg",scale: 1),
      )),
    );
  }
}
