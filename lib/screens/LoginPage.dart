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

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating ? Loading() : Scaffold(
          backgroundColor: Colors.pink[50],
          appBar: AppBar(
            title: Text("Sign In"),
            backgroundColor: Colors.red[300],
            elevation: 0,
            actions: [
              FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
              )
            ],
          ),
          body: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 50,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailTextController,
                      decoration: InputDecoration(
                          hintText: 'email'
                      ),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      textAlignVertical: TextAlignVertical.bottom,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                          hintText: 'password'
                      ),
                      validator: (val) =>
                      val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      textAlignVertical: TextAlignVertical.bottom,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () async {
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
                      child: Text(
                          'Sign in'
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
          )
      ),
    );
  }
}