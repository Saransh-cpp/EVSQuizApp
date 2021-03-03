import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XffFF5B35),
        elevation: 0,
        toolbarHeight: 70,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height/1.85,
              // width: MediaQuery.of(context).size.width,
              child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                        left: MediaQuery.of(context).size.width/3,
                        child: Container(
                          child: Text(
                            'EcoKnow',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                        )
                    ),
                    Positioned(
                      top: 0,
                      child: SvgPicture.asset(
                        'assets/curve.svg',
                      ),
                    ),
                    Positioned(
                      top: 150,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "EcoKnow is a quiz app based on environmental studies!\n\nYou can answer questions and learn stuff\nand the app will store your score\nautomatically\n\nYou can also explore the NGOs section\nto donate and help them in making\nthis world better, piece by piece",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                  ]
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'EcoKnow!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/5.9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    "Made with ❤ by Open Source",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
