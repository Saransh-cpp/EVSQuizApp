import 'package:evs_quiz_app/model/quizData.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {

  QuizData quizData = QuizData();
  Result({this.quizData});

  @override
  _ResuktState createState() => _ResuktState();
}

class _ResuktState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              '${widget.quizData.correct}'
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                '${widget.quizData.incorrect}'
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                '${10 - widget.quizData.notAttempted}'
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
