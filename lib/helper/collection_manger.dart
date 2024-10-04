import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCollectionManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getCurrentUserEmail() {
    final user = _auth.currentUser;
    if (user != null) {
      return user.email!;
    } else {
      // Handle the case where no user is logged in
      return "";
    }
  }

  CollectionReference getMessagesCollection() {
    final userEmail = getCurrentUserEmail();
    if (userEmail.isNotEmpty) {
      return _firestore.collection(userEmail); // Adjusted collection name
    } else {
      // Handle the case where the user email is empty
      throw Exception("User email is not available.");
    }
  }

  CollectionReference getMessagesForUser(String userEmail) {
    if (userEmail.isNotEmpty) {
      return _firestore.collection(userEmail); // Adjusted collection name
    } else {
      // Handle the case where the user email is empty
      throw Exception("User email is not available.");
    }
  }
}
