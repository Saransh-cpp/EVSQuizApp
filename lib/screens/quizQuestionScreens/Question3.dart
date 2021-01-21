// import 'dart:async';
//
// import 'package:evs_quiz_app/screens/quizQuestionScreens/Question4.dart';
// import 'package:evs_quiz_app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class Question3 extends StatefulWidget {
//   @override
//   _Question3State createState() => _Question3State();
// }
//
// class _Question3State extends State<Question3> {
//   @override
//   void initState() {
//     super.initState();
//     nextTimer();
//   }
//
//   nextTimer() {
//     Timer(Duration(seconds: 10), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question4()));
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