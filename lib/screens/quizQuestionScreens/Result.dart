import 'package:evs_quiz_app/model/quizData.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Result extends StatefulWidget {

  QuizData quizData = QuizData();
  Result({this.quizData});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {

    int score = widget.quizData.correct - widget.quizData.incorrect;
    int prevHighScore = Hive.box('preferences').getAt(0);
    print(score);
    if(score > prevHighScore) {
      print('yes');
      Hive.box('preferences').putAt(0, score);
      print(Hive.box('preferences').getAt(0));
    }

    print(Hive.box('preferences').getAt(0));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Correct Answers - ${widget.quizData.correct}/10'
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Incorrect Answers - ${widget.quizData.incorrect}/10'
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Not Attempted - ${10 - widget.quizData.notAttempted}/10'
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
