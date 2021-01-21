// import 'dart:async';
//
// import 'package:evs_quiz_app/screens/quizQuestionScreens/Question5.dart';
// import 'package:flutter/material.dart';
//
// import '../../widgets.dart';
//
// class Question4 extends StatefulWidget {
//   @override
//   _Question4State createState() => _Question4State();
// }
//
// class _Question4State extends State<Question4> {
//   @override
//   void initState() {
//     super.initState();
//     nextTimer();
//   }
//
//   nextTimer() {
//     Timer(Duration(seconds: 10), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question5()));
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