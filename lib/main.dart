import 'package:flutter/material.dart';
import 'package:flutter_samples/admin/admin_panel_page.dart';
import 'package:flutter_samples/auth/auth_gate.dart';
import 'package:flutter_samples/auth/onboarding_view.dart';
import 'package:flutter_samples/auth/signin_view.dart';
import 'package:flutter_samples/auth/signup_view.dart';
import 'package:flutter_samples/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

late SharedPreferences prefs;
void main() async {
// final
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        MainPage.id: (context) => const MainPage(),
        SignUpView.id: (context) => const SignUpView(),
        SignInView.id: (context) => const SignInView(),
        OnBoardingView.id: (context) => const OnBoardingView(),
        AdminPanel.id: (context) => const AdminPanel(),
      },
      home: const AuthGate(),
    );
  }
}
