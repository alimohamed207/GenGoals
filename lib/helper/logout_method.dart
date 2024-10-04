//logout method
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/auth/onboarding_view.dart';

void logout(BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => const OnBoardingView(),
    ), // Route name for your login page
    (Route<dynamic> route) => false, // Remove all routes
  );
}
