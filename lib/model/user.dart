import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  // static const STRIPE_ID = "stripeId";
  // static const NUMBER = 'number';
  // static const USERIMAGE = 'userImage';
  // static const BIO = 'bio';
  static const HIGHSCORE = 'highscore';


  String _name;
  String _email;
  String _id;
  int _highscore;
  // String _stripeId;
  // String _number;
  // String _userImage;
  // String _bio;


//  getters
  String get name => _name;

  String get email => _email;

  String get id => _id;

  int get highscore => _highscore;

  // String get stripeId => _stripeId;

  // String get number => _number;


  // String get userImage => _userImage;

  // String get bio => _bio;


  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    _highscore = snapshot.data()[HIGHSCORE] ?? 0;
    // _number = snapshot.data()[NUMBER] ?? '';
    // _userImage = snapshot.data()[USERIMAGE] ?? "";
    // _stripeId = snapshot.data()[STRIPE_ID] ?? "";
    // _bio = snapshot.data()[BIO] ?? "";
  }
}

