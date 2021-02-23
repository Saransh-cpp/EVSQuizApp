// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class QuizService{
//   getQuizData() async {
//     return await FirebaseFirestore.instance.collection("quizQuestions").snapshots();
//   }
//
//   getQuestionData(String quizId) async{
//     return await FirebaseFirestore.instance
//         .collection("quizQuestions")
//         .doc(quizId)
//         .get();
//   }
// }