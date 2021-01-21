import 'dart:async';

import 'package:evs_quiz_app/screens/quizQuestionScreens/Result.dart';
import 'package:evs_quiz_app/widgets.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}



class _QuestionState extends State<Question> {

  var questions = [
    'test1',
    'test2',
    'test3',
    'test4'
  ];

  var options = [
    ['1', '2', '3', '4'],
    ['5', '6', '7', '8'],
    ['9', '10', '11', '12'],
    ['13', '14', '15', '16']
  ];

  var correctOptions = [
    '1',
    '6',
    '11',
    '16'
  ];

  int questionNumber = 0;
  int counter = 10;
  String chosen ='';
  bool answered = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    nextTimer();
    // counterTimer();
  }

  // counterTimer() {
  //   while(counter>0){
  //     setState(() {
  //       counter -= 1;
  //     });
  //   }
  // }

  Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  nextTimer() {
    const oneSec = const Duration(seconds: 10);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (questionNumber < questions.length - 1) {
          setState(() {
            questionNumber += 1;
            _start = 10;
            chosen = '';
            answered = false;
          });
        } else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (C) => Result()));
        }
      },
    );
    // Timer(Duration(seconds: 10), () {
    //   if(questionNumber <= questions.length) {
    //     setState(() {
    //       questionNumber += 1;
    //       _start = 10;
    //       chosen = '';
    //     });
    //   }
    //   else{
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (C) => Result()));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$questionNumber',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),
                    ),
                    Text(
                      '${_start}',
                      style: TextStyle(
                          fontSize: 20,
                          color: _start < 5 == true ? Colors.red : Colors
                              .blueAccent
                      ),
                    )
                  ],
                ),
              ),
              Text(questions[questionNumber]),
              Container(
                child: Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!answered) {
                              setState(() {
                                chosen = options[questionNumber][0];
                                answered = true;
                              });
                            }
                          },
                          child: Container(
                            color: chosen == options[questionNumber][0] ?
                            options[questionNumber][0] ==
                                correctOptions[questionNumber] ?
                            Colors.greenAccent :
                            Colors.redAccent :
                            Colors.white,
                            child: Row(
                              children: [
                                Text(
                                  options[questionNumber][0],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!answered) {
                              setState(() {
                                chosen = options[questionNumber][1];
                                answered = true;
                              });
                            }
                          },
                          child: Container(
                            color: chosen == options[questionNumber][2] ?
                            options[questionNumber][1] ==
                                correctOptions[questionNumber] ?
                            Colors.greenAccent :
                            Colors.redAccent :
                            Colors.white,
                            child: Row(
                              children: [
                                Text(
                                  options[questionNumber][1],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!answered) {
                              setState(() {
                                chosen = options[questionNumber][2];
                                answered = true;
                              });
                            }
                          },
                          child: Container(
                            color: chosen == options[questionNumber][2] ?
                            options[questionNumber][2] ==
                                correctOptions[questionNumber] ?
                            Colors.greenAccent :
                            Colors.redAccent :
                            Colors.white,
                            child: Row(
                              children: [
                                Text(
                                  options[questionNumber][2],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!answered) {
                              setState(() {
                                chosen = options[questionNumber][3];
                                answered = true;
                              });
                            }
                          },
                          child: Container(
                            color: chosen == options[questionNumber][3] ?
                            options[questionNumber][3] ==
                                correctOptions[questionNumber] ?
                            Colors.greenAccent :
                            Colors.redAccent :
                            Colors.white,
                            child: Row(
                              children: [
                                Text(
                                  options[questionNumber][3],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
