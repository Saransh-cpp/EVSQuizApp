import 'package:evs_quiz_app/model/quizData.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Result extends StatefulWidget {

  QuizData quizData = QuizData();
  Result({this.quizData});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {
    int score = widget.quizData.correct - widget.quizData.incorrect;
    int prevHighScore = Hive.box('preferences').getAt(0);
    print(score);
    if (score > prevHighScore) {
      print('yes');
      Hive.box('preferences').putAt(0, score);
      print(Hive.box('preferences').getAt(0));
    }

    print(Hive.box('preferences').getAt(0));

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[50],
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              score > 5 ? 'Well Done!' : 'Pump up those numbers!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.green[100]],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'Correct Answers: ${widget.quizData.correct}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.red[100]],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'Incorrect Answers: ${widget.quizData.incorrect}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [Colors.grey, Colors.grey[100]],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'Not Attempted: ${10 - widget.quizData.notAttempted}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 90,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [Colors.pink[400], Colors.pink[100]],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text(
                  'Final Score: ${widget.quizData.correct -
                      widget.quizData.incorrect}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            WatchBoxBuilder(
                box: Hive.box('preferences'),
                builder: (context, scoreBox) {
                  return Container(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                        colors: [Colors.pink[400], Colors.pink[100]],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        score < scoreBox.getAt(0)
                            ? 'Welp, not your best :D, keep trying!'
                            : 'Whoa, a new high score!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
