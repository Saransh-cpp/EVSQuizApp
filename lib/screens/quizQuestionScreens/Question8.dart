// import 'dart:async';
//
// import 'package:evs_quiz_app/screens/quizQuestionScreens/Question9.dart';
// import 'package:evs_quiz_app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class Question8 extends StatefulWidget {
//   @override
//   _Question8State createState() => _Question8State();
// }
//
// class _Question8State extends State<Question8> {
//   @override
//   void initState() {
//     super.initState();
//     nextTimer();
//   }
//
//   nextTimer() {
//     Timer(Duration(seconds: 10), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question9()));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: QuizCard(
//         QuestionNumber: '1',
//         question: 'Test?',
//         option1: 'Yes',
//         option2: 'dk',
//         option3: 'No',
//         option4: 'probably',
//         correctOption: 'Yes',
//       ),
//     );
//   }
// }