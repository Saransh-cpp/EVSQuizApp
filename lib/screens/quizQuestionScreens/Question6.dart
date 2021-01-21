import 'dart:async';

import 'package:evs_quiz_app/screens/quizQuestionScreens/Question7.dart';
import 'package:evs_quiz_app/widgets.dart';
import 'package:flutter/material.dart';

class Question6 extends StatefulWidget {
  @override
  _Question6State createState() => _Question6State();
}

class _Question6State extends State<Question6> {
  @override
  void initState() {
    super.initState();
    nextTimer();
  }

  nextTimer() {
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question7()));
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