// import 'dart:async';
//
// import 'package:evs_quiz_app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class Quiz extends StatefulWidget {
//   @override
//   _QuizState createState() => _QuizState();
// }
//
// class _QuizState extends State<Quiz> {
//
//   PageController pageController = PageController();
//   int currentIndex = 0;
//   var currentTab = [
//     QuizCard(
//       QuestionNumber: '1',
//       question: 'Test?',
//       option1: 'Yes',
//       option2: 'dk',
//       option3: 'No',
//       option4: 'probably',
//       correctOption: 'Yes',
//     ),
//     QuizCard(
//       QuestionNumber: '1',
//       question: 'Test?',
//       option1: 'Yes',
//       option2: 'dk',
//       option3: 'No',
//       option4: 'probably',
//       correctOption: 'Yes',
//     ),
//     QuizCard(
//       QuestionNumber: '1',
//       question: 'Test?',
//       option1: 'Yes',
//       option2: 'dk',
//       option3: 'No',
//       option4: 'probably',
//       correctOption: 'Yes',
//     ),
//     QuizCard(
//       QuestionNumber: '1',
//       question: 'Test?',
//       option1: 'Yes',
//       option2: 'dk',
//       option3: 'No',
//       option4: 'probably',
//       correctOption: 'Yes',
//     ),
//     QuizCard(
//       QuestionNumber: '1',
//       question: 'Test?',
//       option1: 'Yes',
//       option2: 'dk',
//       option3: 'No',
//       option4: 'probably',
//       correctOption: 'Yes',
//     ),
//     QuizCard(
//       QuestionNumber: '1',
//       question: 'Test?',
//       option1: 'Yes',
//       option2: 'dk',
//       option3: 'No',
//       option4: 'probably',
//       correctOption: 'Yes',
//     ),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(Duration(seconds: 10), (Timer timer) {
//       if (currentIndex < 5) {
//         currentIndex++;
//       } else {
//         currentIndex = 5;
//       }
//       pageController.animateToPage(
//         currentIndex,
//         duration: Duration(milliseconds: 350),
//         curve: Curves.easeIn,
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         physics: NeverScrollableScrollPhysics(),
//         children: currentTab,
//         controller: pageController,
//         onPageChanged: (int index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
