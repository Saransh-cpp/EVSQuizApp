import 'package:evs_quiz_app/provider/user.dart';
import 'package:evs_quiz_app/screens/Loading.dart';
import 'package:evs_quiz_app/screens/LoginPage.dart';
import 'package:evs_quiz_app/screens/NavBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ScreensController()
      ),
    );
  }
}

class ScreensController extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginPage();
      case Status.Authenticated:
        return NavBar();
      default: return LoginPage();
    }
  }
}