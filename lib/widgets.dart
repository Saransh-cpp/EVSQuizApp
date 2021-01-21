import 'dart:async';

import 'package:flutter/material.dart';

class QuizCard extends StatefulWidget {

  final String QuestionNumber;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String correctOption;

  const QuizCard({Key key, this.question, this.option1, this.option2, this.option3, this.option4, this.correctOption, this.QuestionNumber}) : super(key: key);

  @override
  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {

  int counter = 10;

  @override
  void initState() {
    super.initState();
    startTimer();
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                      widget.QuestionNumber,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),
                    ),
                    Text(
                      '${_start}',
                      style: TextStyle(
                        fontSize: 20,
                        color: _start < 5 == true ? Colors.red : Colors.blueAccent
                      ),
                    )
                  ],
                ),
              ),
              Text(widget.question),
              OptionsCard(
                option1: widget.option1,
                option2: widget.option2,
                option3: widget.option3,
                option4: widget.option4,
                correctOption: widget.correctOption,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsCard extends StatefulWidget {

  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String correctOption;

  const OptionsCard({Key key, this.option1, this.option2, this.option3, this.option4, this.correctOption}) : super(key: key);

  @override
  _OptionsCardState createState() => _OptionsCardState();
}

class _OptionsCardState extends State<OptionsCard> {

  String chosen;
  bool answered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  if(!answered) {
                    setState(() {
                      chosen = widget.option1;
                      answered = true;
                    });
                  }
                },
                child: Container(
                  color: chosen == widget.option1 ?
                  widget.option1 == widget.correctOption ?
                  Colors.greenAccent :
                  Colors.redAccent :
                  Colors.white,
                  child: Row(
                    children: [
                      Text(
                        widget.option1,
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
                if(!answered) {
                  setState(() {
                    chosen = widget.option2;
                    answered = true;
                  });
                }
              },
                child: Container(
                  color: chosen == widget.option2 ?
                  widget.option2 == widget.correctOption ?
                  Colors.greenAccent :
                  Colors.redAccent :
                  Colors.white,
                  child: Row(
                    children: [
                      Text(
                        widget.option2,
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
                    if(!answered) {
                      setState(() {
                        chosen = widget.option3;
                        answered = true;
                      });
                    }
                  },
                child: Container(
                  color: chosen == widget.option3 ?
                  widget.option3 == widget.correctOption ?
                  Colors.greenAccent :
                  Colors.redAccent :
                  Colors.white,
                  child: Row(
                    children: [
                      Text(
                        widget.option3,
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
                    if(!answered) {
                      setState(() {
                        chosen = widget.option4;
                        answered = true;
                      });
                    }
                  },
                child: Container(
                  color: chosen == widget.option4 ?
                  widget.option4 == widget.correctOption ?
                  Colors.greenAccent :
                  Colors.redAccent :
                  Colors.white,
                  child: Row(
                    children: [
                      Text(
                        widget.option4,
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
    );
  }
}
