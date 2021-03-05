import 'dart:async';

import 'package:evs_quiz_app/model/quizData.dart';
import 'package:evs_quiz_app/screens/quizQuestionScreens/Result.dart';
import 'package:evs_quiz_app/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {

  final String question1;
  final String question2;
  final String question3;
  final String question4;
  final String question5;
  final String question6;
  final String question7;
  final String question8;
  final String question9;
  final String question10;

  final String question1option1;
  final String question1option2;
  final String question1option3;
  final String question1option4;
  final String question1correctoption;

  final String question2option1;
  final String question2option2;
  final String question2option3;
  final String question2option4;
  final String question2correctoption;

  final String question3option1;
  final String question3option2;
  final String question3option3;
  final String question3option4;
  final String question3correctoption;

  final String question4option1;
  final String question4option2;
  final String question4option3;
  final String question4option4;
  final String question4correctoption;

  final String question5option1;
  final String question5option2;
  final String question5option3;
  final String question5option4;
  final String question5correctoption;

  final String question6option1;
  final String question6option2;
  final String question6option3;
  final String question6option4;
  final String question6correctoption;

  final String question7option1;
  final String question7option2;
  final String question7option3;
  final String question7option4;
  final String question7correctoption;

  final String question8option1;
  final String question8option2;
  final String question8option3;
  final String question8option4;
  final String question8correctoption;

  final String question9option1;
  final String question9option2;
  final String question9option3;
  final String question9option4;
  final String question9correctoption;

  final String question10option1;
  final String question10option2;
  final String question10option3;
  final String question10option4;
  final String question10correctoption;

  const Question({Key key, this.question1, this.question2, this.question3,
    this.question4, this.question5, this.question6, this.question7, this.question8,
    this.question9, this.question10, this.question1option1, this.question1option2,
    this.question1option3, this.question1option4, this.question1correctoption,
    this.question2option1, this.question2option2, this.question2option3,
    this.question2option4, this.question2correctoption, this.question3option1,
    this.question3option2, this.question3option3, this.question3option4,
    this.question3correctoption, this.question4option1, this.question4option2,
    this.question4option3, this.question4option4, this.question4correctoption,
    this.question5option1, this.question5option2, this.question5option3,
    this.question5option4, this.question5correctoption, this.question6option1,
    this.question6option2, this.question6option3, this.question6option4,
    this.question6correctoption, this.question7option1, this.question7option2,
    this.question7option3, this.question7option4, this.question7correctoption,
    this.question8option1, this.question8option2, this.question8option3,
    this.question8option4, this.question8correctoption, this.question9option1,
    this.question9option2, this.question9option3, this.question9option4,
    this.question9correctoption, this.question10option1, this.question10option2,
    this.question10option3, this.question10option4, this.question10correctoption
  }) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}


class _QuestionState extends State<Question> {

  @override
  void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }

  Timer _timer;
  int _start = 10;
  int questionNumber = 0;
  int counter = 10;
  String chosen ='';
  bool answered = false;
  QuizData quizData = QuizData();

  @override
  void initState() {
    super.initState();
    startTimer();
    nextTimer();
  }

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

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }

  nextTimer() {
    const oneSec = const Duration(seconds: 10);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (questionNumber < 10 - 1) {
          setState(() {
            questionNumber += 1;
            _start = 10;
            chosen = '';
            answered = false;
          });
        } else if (questionNumber == 9) {
          Navigator.pushReplacement(context, PageRouteBuilder(
            pageBuilder: (c, a1, a2) =>
                Result(quizData: quizData,),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(
                    opacity: anim, child: child),
          ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      widget.question1,
      widget.question2,
      widget.question3,
      widget.question4,
      widget.question5,
      widget.question6,
      widget.question7,
      widget.question8,
      widget.question9,
      widget.question10
    ];

    var options = [
      [
        widget.question1option1,
        widget.question1option2,
        widget.question1option3,
        widget.question1option4
      ],
      [
        widget.question2option1,
        widget.question2option2,
        widget.question2option3,
        widget.question2option4
      ],
      [
        widget.question3option1,
        widget.question3option2,
        widget.question3option3,
        widget.question3option4
      ],
      [
        widget.question4option1,
        widget.question4option2,
        widget.question4option3,
        widget.question4option4
      ],
      [
        widget.question5option1,
        widget.question5option2,
        widget.question5option3,
        widget.question5option4
      ],
      [
        widget.question6option1,
        widget.question6option2,
        widget.question6option3,
        widget.question6option4
      ],
      [
        widget.question7option1,
        widget.question7option2,
        widget.question7option3,
        widget.question7option4
      ],
      [
        widget.question8option1,
        widget.question8option2,
        widget.question8option3,
        widget.question8option4
      ],
      [
        widget.question9option1,
        widget.question9option2,
        widget.question9option3,
        widget.question9option4
      ],
      [
        widget.question10option1,
        widget.question10option2,
        widget.question10option3,
        widget.question10option4
      ]
    ];

    var correctOptions = [
      widget.question1correctoption,
      widget.question2correctoption,
      widget.question3correctoption,
      widget.question4correctoption,
      widget.question5correctoption,
      widget.question6correctoption,
      widget.question7correctoption,
      widget.question8correctoption,
      widget.question9correctoption,
      widget.question10correctoption
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        body: Center(
          child: Container(

              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${questionNumber + 1}',
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
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 550,
                      decoration: BoxDecoration(
                          color: Colors.indigo[100],
                          borderRadius:
                          BorderRadius.all(Radius.circular(50))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 0),
                            child: Text(
                            questions[questionNumber],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20
                            ),
                        ),
                          ),
                          SizedBox(height: 30,),
                          // Divider(color: Colors.black,),
                          // SizedBox(height: 50,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Column(
                              children: [
                                ListView(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (!answered) {
                                          quizData.notAttempted += 1;
                                          setState(() {
                                            chosen = options[questionNumber][0];
                                            answered = true;
                                            if (chosen ==
                                                correctOptions[questionNumber]) {
                                              quizData.correct += 1;
                                            }
                                            else {
                                              quizData.incorrect += 1;
                                            }
                                          });
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: chosen ==
                                                options[questionNumber][0]
                                                ? options[questionNumber][0] ==
                                                correctOptions[questionNumber] ?
                                            Colors.greenAccent :
                                            Colors.redAccent
                                                :
                                            Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                options[questionNumber][0],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (!answered) {
                                          quizData.notAttempted += 1;
                                          setState(() {
                                            chosen = options[questionNumber][1];
                                            answered = true;
                                            if (chosen ==
                                                correctOptions[questionNumber]) {
                                              quizData.correct += 1;
                                            }
                                            else {
                                              quizData.incorrect += 1;
                                            }
                                          });
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: chosen ==
                                                options[questionNumber][1]
                                                ? options[questionNumber][1] ==
                                                correctOptions[questionNumber] ?
                                            Colors.greenAccent :
                                            Colors.redAccent
                                                :
                                            Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
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
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (!answered) {
                                          quizData.notAttempted += 1;
                                          setState(() {
                                            chosen = options[questionNumber][2];
                                            answered = true;
                                            if (chosen ==
                                                correctOptions[questionNumber]) {
                                              quizData.correct += 1;
                                            }
                                            else {
                                              quizData.incorrect += 1;
                                            }
                                          });
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: chosen ==
                                                options[questionNumber][2]
                                                ? options[questionNumber][2] ==
                                                correctOptions[questionNumber] ?
                                            Colors.greenAccent :
                                            Colors.redAccent
                                                :
                                            Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
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
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (!answered) {
                                          quizData.notAttempted += 1;
                                          setState(() {
                                            chosen = options[questionNumber][3];
                                            answered = true;
                                            if (chosen ==
                                                correctOptions[questionNumber]) {
                                              quizData.correct += 1;
                                            }
                                            else {
                                              quizData.incorrect += 1;
                                            }
                                          });
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: chosen ==
                                                options[questionNumber][3]
                                                ? options[questionNumber][3] ==
                                                correctOptions[questionNumber] ?
                                            Colors.greenAccent :
                                            Colors.redAccent
                                                :
                                            Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
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
                  ]
              )
          ),
        ),
      ),
    );
  }
}
