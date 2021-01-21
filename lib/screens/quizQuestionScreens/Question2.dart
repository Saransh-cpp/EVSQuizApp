// import 'dart:async';
//
// import 'package:evs_quiz_app/screens/quizQuestionScreens/Question3.dart';
// import 'package:evs_quiz_app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class Question2 extends StatefulWidget {
//   @override
//   _Question2State createState() => _Question2State();
// }
//
// class _Question2State extends State<Question2> {
//   @override
//   void initState() {
//     super.initState();
//     nextTimer();
//   }
//
//   nextTimer() {
//     Timer(Duration(seconds: 10), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question3()));
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
