// import 'package:evs_quiz_app/model/quizData.dart';
// import 'package:flutter/material.dart';
// import 'package:evs_quiz_app/widgets.dart';
// import 'dart:async';
// import 'package:evs_quiz_app/screens/quizQuestionScreens/Question2.dart';
//
// class Question1 extends StatefulWidget {
//
//   // final String question1;
//   // final String question2;
//   // final String question3;
//   // final String question4;
//   // final String question5;
//   // final String question6;
//   // final String question7;
//   // final String question8;
//   // final String question9;
//   // final String question10;
//   //
//   // final String option1_1;
//   // final String option1_2;
//   // final String option1_3;
//   // final String option1_4;
//   // final String correctOption1;
//   //
//   // final String option2_1;
//   // final String option2_2;
//   // final String option2_3;
//   // final String option2_4;
//   // final String correctOption2;
//   //
//   // final String option3_1;
//   // final String option3_2;
//   // final String option3_3;
//   // final String option3_4;
//   // final String correctOption3;
//   //
//   // final String option4_1;
//   // final String option4_2;
//   // final String option4_3;
//   // final String option4_4;
//   // final String correctOption4;
//   //
//   // final String option5_1;
//   // final String option5_2;
//   // final String option5_3;
//   // final String option5_4;
//   // final String correctOption5;
//   //
//   // final String option6_1;
//   // final String option6_2;
//   // final String option6_3;
//   // final String option6_4;
//   // final String correctOption6;
//   //
//   // final String option7_1;
//   // final String option7_2;
//   // final String option7_3;
//   // final String option7_4;
//   // final String correctOption7;
//   //
//   // final String option8_1;
//   // final String option8_2;
//   // final String option8_3;
//   // final String option8_4;
//   // final String correctOption8;
//   //
//   // final String option9_1;
//   // final String option9_2;
//   // final String option9_3;
//   // final String option9_4;
//   // final String correctOption9;
//   //
//   // final String option10_1;
//   // final String option10_2;
//   // final String option10_3;
//   // final String option10_4;
//   // final String correctOption10;
//   //
//   // const Question1({Key key, this.question1, this.question2, this.question3,
//   //   this.question4, this.question5, this.question6, this.question7, this.question8,
//   //   this.question9, this.question10, this.option1_1, this.option1_2, this.option1_3,
//   //   this.option1_4, this.correctOption1, this.option2_1, this.option2_2,
//   //   this.option2_3, this.option2_4, this.correctOption2, this.option3_1,
//   //   this.option3_2, this.option3_3, this.option3_4, this.correctOption3,
//   //   this.option4_1, this.option4_2, this.option4_3, this.option4_4,
//   //   this.correctOption4, this.option5_1, this.option5_2, this.option5_3,
//   //   this.option5_4, this.correctOption5, this.option6_1, this.option6_2,
//   //   this.option6_3, this.option6_4, this.correctOption6, this.option7_1,
//   //   this.option7_2, this.option7_3, this.option7_4, this.correctOption7,
//   //   this.option8_1, this.option8_2, this.option8_3, this.option8_4,
//   //   this.correctOption8, this.option9_1, this.option9_2, this.option9_3,
//   //   this.option9_4, this.correctOption9, this.option10_1, this.option10_2,
//   //   this.option10_3, this.option10_4, this.correctOption10}) : super(key: key);
//
//
//   @override
//   _Question1State createState() => _Question1State();
// }
//
// class _Question1State extends State<Question1> {
//
//   @override
//   void initState() {
//     super.initState();
//     nextTimer();
//   }
//
//   nextTimer() {
//     Timer(Duration(seconds: 10), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question2()));
//     });
//   }
//
//   QuizData quizData = QuizData();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: QuizCard(
//         QuestionNumber: '1',
//         question: 'test?',
//         option1: 'Yes',
//         option2: 'dk',
//         option3: 'no',
//         option4: 'probably',
//         correctOption: 'yes',
//       ),
//     );
//   }
// }
