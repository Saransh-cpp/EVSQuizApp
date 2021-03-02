import 'package:evs_quiz_app/provider/user.dart';
import 'package:evs_quiz_app/screens/NavBar.dart';
import 'package:evs_quiz_app/screens/quizQuestionScreens/Question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evs_quiz_app/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    final userProvider = Provider.of<UserProvider>(context);

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
                        // userProvider.signOut();
                      },
                    ),
                    Divider(),
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
                        // userProvider.signOut();
                      },
                    ),
                    Divider(),
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
          toolbarHeight: 70,
          backgroundColor: Colors.pink[50],
          elevation: 0,
          iconTheme: IconThemeData(
              color: Colors.black87
          ),
          // title: Text(
          //   'EcoKnow',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       color: Colors.black87,
          //       fontSize: 30
          //   ),
          // ),
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
                'Welcome back!\n${userProvider.userModel?.name}!',
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
                  Navigator.push(context, MaterialPageRoute(builder: (c) =>
                      Question(
                        question1: 'Test1',
                        question2: 'test2',
                        question3: 'test3',
                        question4: 'test4',
                        question5: 'test5',
                        question6: 'test6',
                        question7: 'test7',
                        question8: 'test8',
                        question9: 'test9',
                        question10: 'test10',

                        question1option1: 'yes',
                        question1option2: 'no',
                        question1option3: 'probably',
                        question1option4: 'dk',
                        question1correctoption: 'yes',

                        question2option1: 'yes',
                        question2option2: 'no',
                        question2option3: 'probably',
                        question2option4: 'dk',
                        question2correctoption: 'yes',

                        question3option1: 'yes',
                        question3option2: 'no',
                        question3option3: 'probably',
                        question3option4: 'dk',
                        question3correctoption: 'yes',

                        question4option1: 'yes',
                        question4option2: 'no',
                        question4option3: 'probably',
                        question4option4: 'dk',
                        question4correctoption: 'yes',

                        question5option1: 'yes',
                        question5option2: 'no',
                        question5option3: 'probably',
                        question5option4: 'dk',
                        question5correctoption: 'yes',

                        question6option1: 'yes',
                        question6option2: 'no',
                        question6option3: 'probably',
                        question6option4: 'dk',
                        question6correctoption: 'yes',

                        question7option1: 'yes',
                        question7option2: 'no',
                        question7option3: 'probably',
                        question7option4: 'dk',
                        question7correctoption: 'yes',

                        question8option1: 'yes',
                        question8option2: 'no',
                        question8option3: 'probably',
                        question8option4: 'dk',
                        question8correctoption: 'yes',

                        question9option1: 'yes',
                        question9option2: 'no',
                        question9option3: 'probably',
                        question9option4: 'dk',
                        question9correctoption: 'yes',

                        question10option1: 'yes',
                        question10option2: 'no',
                        question10option3: 'probably',
                        question10option4: 'dk',
                        question10correctoption: 'yes',
                      )));
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
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  children: [
                    Text(
                      'Your highest score:',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20
                      ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
