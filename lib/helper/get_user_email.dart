import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

String? getCurrentUserEmail() {
  final user = _auth.currentUser;
  if (user != null) {
    return user.email;
  } else {
    return null; // Handle case where no user is logged in
  }
}
