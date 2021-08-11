import 'package:flutter/material.dart';
import './homescreen.dart';
import './donorscreen.dart';
import './recieverscreen.dart';

class Tabscreen extends StatefulWidget {
  @override
  _TabscreenState createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  final List<Map<String, dynamic>> pages = [
    {'page': Homescreen(), 'title': 'BLOODBANK'},
    {'page': DonateScreen(), 'title': 'DONOR'},
    {'page': RecieverScreen(), 'title': 'DETAILS'}
  ];
  int pageindex = 0;
  void selectpage(int i) {
    setState(() {
      pageindex = i;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text(pages[pageindex]['title']),),
    body: pages[pageindex]['page'],
     bottomNavigationBar: BottomNavigationBar(
       onTap: selectpage,
       currentIndex: pageindex,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.bloodtype), title: Text('Donate')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Details')),
          ],
        )
    
    );
  }
}
