import 'package:evs_quiz_app/widgets.dart';
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
      body: ListView(
        children: [
          NGOCard(
            name: 'Name',
            description: 'Description',
            website: 'www.kuchbhee.com',
            number: 'XXXXXXXXXX',
          ),
          NGOCard(
            name: 'Name',
            description: 'Description',
            website: 'www.kuchbhee.com',
            number: 'XXXXXXXXXX',
          ),
          NGOCard(
            name: 'Name',
            description: 'Description',
            website: 'www.kuchbhee.com',
            number: 'XXXXXXXXXX',
          ),
          NGOCard(
            name: 'Name',
            description: 'Description',
            website: 'www.kuchbhee.com',
            number: 'XXXXXXXXXX',
          ),
          NGOCard(
            name: 'Name',
            description: 'Description',
            website: 'www.kuchbhee.com',
            number: 'XXXXXXXXXX',
          )
        ],
      ),
    );
  }
}
