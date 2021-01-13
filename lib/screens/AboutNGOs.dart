import 'package:flutter/material.dart';

class AboutNGOs extends StatefulWidget {
  @override
  _AboutNGOsState createState() => _AboutNGOsState();
}

class _AboutNGOsState extends State<AboutNGOs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Text(
          'About NGOs'
        ),
      ),
    );
  }
}
