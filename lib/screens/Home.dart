import 'package:evs_quiz_app/model/quizQuestionAndAnswers.dart';
import 'package:evs_quiz_app/provider/user.dart';
import 'package:evs_quiz_app/screens/AboutUs.dart';
import 'package:evs_quiz_app/screens/Contributors.dart';
import 'package:evs_quiz_app/screens/quizQuestionScreens/Question.dart';
import 'package:evs_quiz_app/services/HiveService.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  final score;

  const Home({Key key, this.score}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Future<int> checkScore() async {
  //   HiveService hiveService = Hive.box('preferences').getAt(0) as HiveService;
  //   return hiveService.highScore;
  // }

  int highScore = Hive.box('preferences').getAt(0);

  @override
  Widget build(BuildContext context) {
    print(widget.score);

    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    final userProvider = Provider.of<UserProvider>(context);
    QuizQuestionAndAnswers quizQuestionAndAnswers = QuizQuestionAndAnswers();
    List<dynamic> questionAndAnswers = quizQuestionAndAnswers
        .questionsAndAnswers;
    questionAndAnswers.shuffle();

    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        backgroundColor: Colors.pink[50],
        drawer: Drawer(
          child: InkWell(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink[100], Colors.pink[100]],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )),
                  accountName: Text(
                    userProvider.userModel?.name ?? "username loading...",
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                  accountEmail: Text(
                      userProvider.userModel?.email ?? "email loading...",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                      ),
                      title: Text(
                        'About us',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) =>
                                  AboutUs(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(
                                      opacity: anim, child: child),
                            ));
                      },
                    ),
                    Divider(color: Colors.black,),
                    ListTile(
                      leading: Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Contributors',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) =>
                                  Contributors(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(
                                      opacity: anim, child: child),
                            ));
                      },
                    ),
                    Divider(color: Colors.black,),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        userProvider.signOut();
                      },
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {

                });
              },
            )
          ],
          toolbarHeight: 70,
          backgroundColor: Colors.pink[50],
          elevation: 0,
          iconTheme: IconThemeData(
              color: Colors.black87
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(40, 40, 40, 40),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [Colors.pink[400], Colors.pink[100]],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
              ),
              child: Text(
                'Welcome back\n${userProvider.userModel?.name}!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [Colors.pink[400], Colors.pink[100]],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
              ),
              child: MaterialButton(
                onPressed: () {
                  questionAndAnswers.shuffle();
                  print(questionAndAnswers);
                  Navigator.push(context,
                      PageRouteBuilder(
                      pageBuilder: (c, a1, a2) =>
                      Question(
                          question1: questionAndAnswers[0][0],
                          question2: questionAndAnswers[1][0],
                          question3: questionAndAnswers[2][0],
                          question4: questionAndAnswers[3][0],
                          question5: questionAndAnswers[4][0],
                          question6: questionAndAnswers[5][0],
                          question7: questionAndAnswers[6][0],
                          question8: questionAndAnswers[7][0],
                          question9: questionAndAnswers[8][0],
                          question10: questionAndAnswers[9][0],

                          question1option1: questionAndAnswers[0][1][0],
                          question1option2: questionAndAnswers[0][1][1],
                          question1option3: questionAndAnswers[0][1][2],
                          question1option4: questionAndAnswers[0][1][3],
                          question1correctoption: questionAndAnswers[0][1][4],

                          question2option1: questionAndAnswers[1][1][0],
                          question2option2: questionAndAnswers[1][1][1],
                          question2option3: questionAndAnswers[1][1][2],
                          question2option4: questionAndAnswers[1][1][3],
                          question2correctoption: questionAndAnswers[1][1][4],

                          question3option1: questionAndAnswers[2][1][0],
                          question3option2: questionAndAnswers[2][1][1],
                          question3option3: questionAndAnswers[2][1][2],
                          question3option4: questionAndAnswers[2][1][3],
                          question3correctoption: questionAndAnswers[2][1][4],

                          question4option1: questionAndAnswers[3][1][0],
                          question4option2: questionAndAnswers[3][1][1],
                          question4option3: questionAndAnswers[3][1][2],
                          question4option4: questionAndAnswers[3][1][3],
                          question4correctoption: questionAndAnswers[3][1][4],

                          question5option1: questionAndAnswers[4][1][0],
                          question5option2: questionAndAnswers[4][1][1],
                          question5option3: questionAndAnswers[4][1][2],
                          question5option4: questionAndAnswers[4][1][3],
                          question5correctoption: questionAndAnswers[4][1][4],

                          question6option1: questionAndAnswers[5][1][0],
                          question6option2: questionAndAnswers[5][1][1],
                          question6option3: questionAndAnswers[5][1][2],
                          question6option4: questionAndAnswers[5][1][3],
                          question6correctoption: questionAndAnswers[5][1][4],

                          question7option1: questionAndAnswers[6][1][0],
                          question7option2: questionAndAnswers[6][1][1],
                          question7option3: questionAndAnswers[6][1][2],
                          question7option4: questionAndAnswers[6][1][3],
                          question7correctoption: questionAndAnswers[6][1][4],

                          question8option1: questionAndAnswers[7][1][0],
                          question8option2: questionAndAnswers[7][1][1],
                          question8option3: questionAndAnswers[7][1][2],
                          question8option4: questionAndAnswers[7][1][3],
                          question8correctoption: questionAndAnswers[7][1][4],

                          question9option1: questionAndAnswers[8][1][0],
                          question9option2: questionAndAnswers[8][1][1],
                          question9option3: questionAndAnswers[8][1][2],
                          question9option4: questionAndAnswers[8][1][3],
                          question9correctoption: questionAndAnswers[8][1][4],

                          question10option1: questionAndAnswers[9][1][0],
                          question10option2: questionAndAnswers[9][1][1],
                          question10option3: questionAndAnswers[9][1][2],
                          question10option4: questionAndAnswers[9][1][3],
                          question10correctoption: questionAndAnswers[9][1][4],
                        ),
                  transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(
                  opacity: anim, child: child),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Test your\nknowledge now!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [Colors.pink[400], Colors.pink[100]],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: WatchBoxBuilder(
                  box: Hive.box('preferences'),
                  builder: (context, scoreBox) {
                    if (scoreBox
                        .getAt(0) == null) {
                      return Center(
                        child: Text(
                            "Play a game :D"
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: [
                          Text(
                            'Your highest score: ${scoreBox.getAt(0)}',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(
                                      Icons.refresh
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      scoreBox.putAt(0, 0);
                                    });
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Your high score is 0 now!')));
                                  }
                              ),
                              Text(
                                'Reset your score here',
                                textAlign: TextAlign.center,
                              )

                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Take the quiz again to boost your score!',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
