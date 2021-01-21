import 'dart:async';

import 'package:evs_quiz_app/screens/quizQuestionScreens/Result.dart';
import 'package:evs_quiz_app/widgets.dart';
import 'package:flutter/material.dart';

class Question10 extends StatefulWidget {
  @override
  _Question10State createState() => _Question10State();
}

class _Question10State extends State<Question10> {
  @override
  void initState() {
    super.initState();
    nextTimer();
  }

  nextTimer() {
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Result()));
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