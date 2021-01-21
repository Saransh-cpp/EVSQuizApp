import 'package:flutter/material.dart';
import 'package:evs_quiz_app/widgets.dart';
import 'dart:async';
import 'package:evs_quiz_app/screens/quizQuestionScreens/Question2.dart';

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {

  @override
  void initState() {
    super.initState();
    nextTimer();
  }

  nextTimer() {
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question2()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: QuizCard(
        QuestionNumber: '1',
        question: 'Test?',
        option1: 'Yes',
        option2: 'dk',
        option3: 'No',
        option4: 'probably',
        correctOption: 'Yes',
      ),
    );
  }
}
