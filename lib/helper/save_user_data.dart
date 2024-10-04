import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveUserData(
    {required User user,
    required int points,
    required int tasks,
    required int videosWathsed,
    required int quizPlayed,
    required String name,
    required String email,
    required String password}) async {
  try {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    Map<String, dynamic> userData = {
      'points': points,
      'name': name,
      'email': email,
      'password': password,
      'tasks': tasks,
      'videosWathsed': videosWathsed,
      'quizPlayed': quizPlayed,
    };

    await documentReference.set(userData);
  } catch (e) {
    throw ('Error saving user data: $e');
  }
}
