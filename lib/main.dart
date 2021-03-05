import 'package:evs_quiz_app/provider/user.dart';
import 'package:evs_quiz_app/screens/Loading.dart';
import 'package:evs_quiz_app/screens/LoginPage.dart';
import 'package:evs_quiz_app/screens/NavBar.dart';
import 'package:evs_quiz_app/services/HiveService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final directory = await path.getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(HiveServiceAdapter());
  await Hive.openBox('preferences');
  try {
      final r = Hive.box('preferences').getAt(0);
    } on RangeError catch (e) {
      print('Exception');
      Hive.box('preferences').add(0);

    }
    print(Hive.box('preferences').getAt(0));


  // try {
  //   final r = result.getAt(0) as HiveService ;
  // } on RangeError catch (e) {
  //   print('Exception');
  //   final r = result.add(HiveService(
  //       highScore: 3,
  //   ));
  // }
  //
  // final r = result.add(HiveService(
  //     highScore: 3,
  // ));

  // final score = highScore.getAt(0) ?? 'Play a game first :D';

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Future<int> checkScore() async {
  //   HiveService hiveService = Hive.box('preferences').getAt(0) as HiveService;
  //   return hiveService.highScore;
  // }

  @override
  Widget build(BuildContext context) {
    // Future<int> score = checkScore();

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