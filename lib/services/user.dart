import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evs_quiz_app/model/user.dart';
import 'package:flutter/cupertino.dart';

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  createUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
      return true;
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  updateUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
      return true;
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}