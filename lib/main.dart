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
  final highScore = await Hive.openBox('preferences');

  highScore.putAt(0, 0);

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

  final score = highScore.getAt(0);

  runApp(MyApp(score: score,));
}

class MyApp extends StatelessWidget {

  // Future<int> checkScore() async {
  //   HiveService hiveService = Hive.box('preferences').getAt(0) as HiveService;
  //   return hiveService.highScore;
  // }
  final score;

  const MyApp({Key key, this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<int> score = checkScore();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ScreensController(score: score,)
      ),
    );
  }
}

class ScreensController extends StatelessWidget {
  final score;

  const ScreensController({Key key, this.score}) : super(key: key);

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
        return NavBar(score: score,);
      default: return LoginPage();
    }
  }
}