import 'dart:math';

import 'package:evs_quiz_app/provider/user.dart';
import 'package:evs_quiz_app/screens/NavBar.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({
    this.toggleView
  });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //Santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  //UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();


  String email = '';
  String password = '';
  String error = '';
  String name = '';
  bool hidePass = true;
  String userImageUrl = '';


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width / 1.1;
    double _screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return user.status == Status.Authenticating ? Loading() : Scaffold(
      backgroundColor: Colors.indigo[600],
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Welcome to\n EcoKnow!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
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
                          controller: _nameTextController,
                          decoration: InputDecoration(
                              hintText: "Enter Name",
                              prefixIcon: Icon(Icons.person)),
                          validator: (val) =>
                          val.isEmpty ? 'Enter a name' : null,
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
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
                        child: TextFormField(
                          controller: _emailTextController,
                          decoration: InputDecoration(
                              hintText: "Enter email",
                              prefixIcon: Icon(Icons.email)),
                          validator: (val) =>
                          val.isEmpty ? 'Enter an email' : null,
                          textAlignVertical: TextAlignVertical.bottom,
                          // net ninja
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                      ),
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
                      // ListTile(
                      //   title: TextFormField(
                      //     controller: _passwordTextController,
                      //     validator: (val) =>
                      //     val.length < 6
                      //         ? 'Enter a password 6+ chars long'
                      //         : null,
                      //     textAlignVertical: TextAlignVertical.bottom,
                      //     obscureText: hidePass,
                      //     // net ninja
                      //     onChanged: (val) {
                      //       setState(() {
                      //         password = val;
                      //       });
                      //     },
                      //   ),
                      //   trailing: IconButton(
                      //       icon: Icon(Icons.remove_red_eye),
                      //       onPressed: () {
                      //         setState(() {
                      //           hidePass = !hidePass;
                      //         });
                      //       }),
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
                            controller: _confirmPasswordController,
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
                      //   controller: _confirmPasswordController,
                      //   validator: (val) =>
                      //   val.length < 6
                      //       ? 'Enter a password 6+ chars long'
                      //       : null,
                      //   textAlignVertical: TextAlignVertical.bottom,
                      //   obscureText: true,
                      //   //onChanged: (val) {
                      //   //setState(() {
                      //   //password = val;
                      //   //});
                      //   //},
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            if (!await user.signUp(
                                _nameTextController.text,
                                _emailTextController.text,
                                _passwordTextController.text)) {
                              _key.currentState.showSnackBar(SnackBar(
                                  content: Text("Sign up failed")));
                              return;
                            }
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => NavBar()));
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
                            "Sign Up",
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
                      //     // net ninja
                      //     //if (_formKey.currentState.validate()) {
                      //
                      //     if (_formKey.currentState.validate()) {
                      //       if (!await user.signUp(
                      //           _nameTextController.text,
                      //           _emailTextController.text,
                      //           _passwordTextController.text)) {
                      //         _key.currentState.showSnackBar(SnackBar(
                      //             content: Text("Sign up failed")));
                      //         return;
                      //       }
                      //       Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (c) => NavBar()));
                      //     }
                      //   },
                      //   child: Text('Register'),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(
                          'I already have an account',
                          style: TextStyle(color: Colors.red, fontSize: 15),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class UserServices{
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   String collection = "users";
//
//   void createUser(Map data) {
//     _firestore.collection(collection).doc(data["userId"]).set(data);
//   }
// }

