import 'package:evs_quiz_app/widgets.dart';
import 'package:flutter/material.dart';

class Contributors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.pink[50],
        toolbarHeight: 70,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Our valuable contributors',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30
              ),
            ),
            GridView.count(
                crossAxisCount: 2,
              children: [
                ContributorCard(
                  name: 'Saransh',
                  GitHubUsername: 'Saransh-cpp',
                  GitHubLink: 'https://github.com/Saransh-cpp',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
