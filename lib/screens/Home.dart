import 'package:evs_quiz_app/provider/user.dart';
import 'package:evs_quiz_app/screens/Quiz.dart';
import 'package:evs_quiz_app/screens/quizQuestionScreens/Question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evs_quiz_app/widgets.dart';
import 'package:evs_quiz_app/screens/quizQuestionScreens/Question1.dart';

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
                          colors: <Color>[
                            Colors.deepOrange,
                            Colors.orangeAccent,
                          ]
                      )
                  ),
                  accountName: Text(
                    userProvider.userModel?.name ?? "username loading...",
                  ),
                  accountEmail: Text(
                    userProvider.userModel?.email ?? "email loading...",
                  ),
                ),
                Container(
                  height: 600,
                  color: Colors.pink[50],
                  child: Column(
                    children: [
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
                )


              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      // onSubmitted: () {},
                      decoration: InputDecoration(
                        hintText: "Type any topic",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) => Question()));
              },
              child: Text('Quiz'),
            )
          ],
        )
      ),
    );
  }
}
