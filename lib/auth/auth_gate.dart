import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/admin/admin_panel_page.dart';
import 'package:flutter_samples/auth/onboarding_view.dart';
import 'package:flutter_samples/pages/main_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  static String id = 'AuthGate';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            if (snapshot.data!.email!.trim() == 'admin@gg.com') {
              return const AdminPanel();
            } else {
              return const MainPage();
            }
          }
          //user is NOT logged in
          else {
            return const OnBoardingView();
          }
        },
      ),
    );
  }
}
