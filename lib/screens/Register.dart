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
  File _imageFile;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double _screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.yellow,
      key: _key,
      body: user.status == Status.Authenticating ? Loading() : Scaffold(
        backgroundColor: Colors.pink[50],
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Welcome to\n Chapter 3',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
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
                        ListTile(
                          title: TextFormField(
                            controller: _passwordTextController,
                            validator: (val) =>
                            val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            textAlignVertical: TextAlignVertical.bottom,
                            obscureText: hidePass,
                            // net ninja
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePass = !hidePass;
                                });
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _confirmPasswordController,
                          validator: (val) =>
                          val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          textAlignVertical: TextAlignVertical.bottom,
                          obscureText: true,
                          //onChanged: (val) {
                          //setState(() {
                          //password = val;
                          //});
                          //},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            // net ninja
                            //if (_formKey.currentState.validate()) {

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
                          child: Text('Register'),
                        ),
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

