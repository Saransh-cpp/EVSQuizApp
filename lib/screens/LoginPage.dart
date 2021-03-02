import 'package:evs_quiz_app/provider/user.dart';
import 'package:evs_quiz_app/screens/Loading.dart';
import 'package:evs_quiz_app/screens/NavBar.dart';
import 'package:evs_quiz_app/screens/Register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }else {
      return Register(toggleView: toggleView);
    }

  }
}

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({
    this.toggleView
  });
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool loading = false;
  bool hidePass = true;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width / 1.1;
    final user = Provider.of<UserProvider>(context);
    return user.status == Status.Authenticating ? Loading() : Scaffold(
        backgroundColor: Colors.indigo[600],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back to\nEcoKnow!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          height: 70,
                          width: _screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(0),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                                hintText: "Enter mail",
                                prefixIcon: Icon(Icons.mail)),
                            validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                            textAlignVertical: TextAlignVertical.bottom,
                          ),
                        ),
                        // TextFormField(
                        //   controller: _emailTextController,
                        //   decoration: InputDecoration(
                        //       hintText: 'email'
                        //   ),
                        //   validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   onChanged: (val) {
                        //     setState(() {
                        //       email = val;
                        //     });
                        //   },
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 70,
                          width: _screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(0),
                          child: ListTile(
                            leading: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    hidePass = !hidePass;
                                  });
                                }),
                            title: TextFormField(
                              obscureText: hidePass,
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                hintText: "Enter password",
                              ),
                              validator: (val) =>
                              val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              textAlignVertical: TextAlignVertical.bottom,
                            ),
                          ),
                        ),
                        // TextFormField(
                        //   controller: _passwordTextController,
                        //   decoration: InputDecoration(
                        //       hintText: 'password'
                        //   ),
                        //   validator: (val) =>
                        //   val.length < 6
                        //       ? 'Enter a password 6+ chars long'
                        //       : null,
                        //   textAlignVertical: TextAlignVertical.bottom,
                        //   obscureText: true,
                        //   onChanged: (val) {
                        //     setState(() {
                        //       password = val;
                        //     });
                        //   },
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              if (!await user.signIn(_emailTextController.text,
                                  _passwordTextController.text)) {
                                _key.currentState.showSnackBar(SnackBar(
                                    content: Text(
                                        "Sign in failed")));
                              }
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (c) =>
                                  NavBar()));
                            }
                          },
                          child: Container(
                            width: _screenWidth,
                            height: 50,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(2),
                            // 15
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Text(
                              "Sign In",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        // RaisedButton(
                        //   onPressed: () async {
                        //     if (_formKey.currentState.validate()) {
                        //       if (!await user.signIn(_emailTextController.text,
                        //           _passwordTextController.text)) {
                        //         _key.currentState.showSnackBar(SnackBar(
                        //             content: Text(
                        //                 "Sign in failed")));
                        //       }
                        //       Navigator.pushReplacement(
                        //           context, MaterialPageRoute(builder: (c) =>
                        //           NavBar()));
                        //     }
                        //   },
                        //   child: Text(
                        //       'Sign in'
                        //   ),
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text(
                            'I am new here',
                            style: TextStyle(color: Colors.lightBlueAccent[100], fontSize: 15),
                          ),
                        ),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          ),
        )
    );
  }
}