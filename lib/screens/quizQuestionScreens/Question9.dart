// import 'dart:async';
//
// import 'package:evs_quiz_app/screens/quizQuestionScreens/Question10.dart';
// import 'package:evs_quiz_app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class Question9 extends StatefulWidget {
//   @override
//   _Question9State createState() => _Question9State();
// }
//
// class _Question9State extends State<Question9> {
//   @override
//   void initState() {
//     super.initState();
//     nextTimer();
//   }
//
//   nextTimer() {
//     Timer(Duration(seconds: 10), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question10()));
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