import 'package:bloodbank/screens/tabscreen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
            pages: [
          PageViewModel(
            title: 'Donate to others',
            body: 'Donate to individual cases in one step',
            image: Image.asset('assets/images/s1.png'),
            decoration: pagedecoration(),
          ),
          PageViewModel(
            title: 'Contact the donors',
            body: 'Contacting donors coming moment by moment',
            image: Image.asset('assets/images/s2.png'),
            decoration: pagedecoration(),
          ),
          PageViewModel(
              title: 'Start donating',
              body: 'welcome',
              image: Image.asset(
                'assets/images/s3.png',
              ),
              decoration: pagedecoration(),
              footer: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ignore: deprecated_member_use
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    child: FlatButton(
                      height: 50,
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => Tabscreen()));
                      },
                      child: Text(
                        'Get started',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ))
        ],
            done: Icon(
              Icons.arrow_forward,
              size: 40,
            ),
            onDone: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => Tabscreen()));
            },
            next: Icon(
              Icons.arrow_forward,
              size: 40,
            ),
            dotsDecorator: DotsDecorator(
            
              activeColor: Colors.red,
              size: Size(10, 10),
              activeSize: Size(22, 10),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
//         ),
              ),
            )));
  }

  PageDecoration pagedecoration() => PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(
        fontSize: 20,
      ),
      imagePadding: EdgeInsets.all(30));
}
