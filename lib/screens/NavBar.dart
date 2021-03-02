import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:evs_quiz_app/screens/AboutNGOs.dart';
import 'package:evs_quiz_app/screens/Home.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {

  final score;

  const NavBar({Key key, this.score}) : super(key: key);
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  PageController pageController = PageController();
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {

    var currentTab = [
      Home(score: widget.score,),
      AboutNGOs(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        PageView(
          children: currentTab,
          controller: pageController,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: CurvedNavigationBar(
            height: 60.0,
            backgroundColor: Colors.pink[50],
            // buttonBackgroundColor: Colors.white,
            color: Colors.white,
            items: <Widget>[
              Icon(
                  Icons.home_rounded,
                  size: 30
              ),
              Icon(
                  Icons.storage,
                  size: 30
              ),

            ],
            index: currentIndex,
            animationCurve: Curves.easeInToLinear,

            animationDuration: Duration(
                milliseconds: 500
            ),
            onTap: (int index) {
              setState(() {
                currentIndex = index;
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              });
            }
            ),
      ),
    );
  }
}