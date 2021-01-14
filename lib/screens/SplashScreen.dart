import 'dart:async';

import 'package:evs_quiz_app/screens/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  splashTimer() {
    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavBar()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitPouringHourglass(color: Colors.black,)),
    );
  }
}
