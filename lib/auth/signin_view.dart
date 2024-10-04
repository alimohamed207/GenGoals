import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/admin/admin_panel_page.dart';
import 'package:flutter_samples/auth/signup_view.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/components/my_button.dart';
import 'package:flutter_samples/components/normal_text_form_filed.dart';
import 'package:flutter_samples/components/pw_text_form_filed.dart';
import 'package:flutter_samples/components/show_snack_bar.dart';
import 'package:flutter_samples/pages/main_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static String id = 'SignInVIew';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String? email, password;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  //Animation
  var foucsNodeEmail = FocusNode();
  var foucsNodePassword = FocusNode();
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;

  @override
  void initState() {
    foucsNodeEmail.addListener(() {
      setState(() {
        isFocusedEmail = foucsNodeEmail.hasFocus;
      });
    });
    foucsNodePassword.addListener(() {
      setState(() {
        isFocusedPassword = foucsNodePassword.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const Center(
        child: SpinKitChasingDots(
          color: AppColors.primaryColor,
          size: 30,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      height: 850,
                      decoration:
                          const BoxDecoration(color: AppColors.whiteColor),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          FadeInDown(
                            delay: const Duration(milliseconds: 900),
                            duration: const Duration(milliseconds: 1000),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  IconlyBroken.arrow_left,
                                  size: 36,
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInDown(
                                  delay: const Duration(milliseconds: 800),
                                  duration: const Duration(milliseconds: 900),
                                  child: const Text(
                                    'Let\'s Sign You In',
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FadeInDown(
                                  delay: const Duration(milliseconds: 700),
                                  duration: const Duration(milliseconds: 800),
                                  child: const Text(
                                    'Welcome Back.',
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                FadeInDown(
                                  delay: const Duration(milliseconds: 600),
                                  duration: const Duration(milliseconds: 700),
                                  child: const Text(
                                    'You\'ve been missed!',
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeInDown(
                            delay: const Duration(milliseconds: 700),
                            duration: const Duration(milliseconds: 800),
                            child: const Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // Email Text Filed
                          NormaltextFormFiled(
                            onChanged: (data) {
                              email = data;
                            },
                            label: 'Your Email',
                            icon: const Icon(EvaIcons.email),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeInDown(
                            delay: const Duration(milliseconds: 500),
                            duration: const Duration(milliseconds: 600),
                            child: const Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // Password Form Filed
                          PwTextFormField(
                            onChanged: (data) {
                              password = data;
                            },
                            label: 'Your Password',
                          ),

                          const Expanded(
                            child: SizedBox(
                              height: 10,
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 600),
                            duration: const Duration(milliseconds: 700),
                            child: MyButton(
                              text: 'Sign In',
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  isLoading = true;
                                  setState(() {});
                                  //login method
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                      email: email!.trim(),
                                      password: password!.trim(),
                                    );
                                    String? userName = '';

                                    Future<void> fetchUserName() async {
                                      final firestore =
                                          FirebaseFirestore.instance;
                                      final user =
                                          FirebaseAuth.instance.currentUser;

                                      if (user == null) {
                                        // Handle user not being logged in
                                        return;
                                      }

                                      final userDocRef = firestore
                                          .collection('users')
                                          .doc(user.uid);
                                      final userSnapshot =
                                          await userDocRef.get();

                                      if (userSnapshot.exists) {
                                        final userData = userSnapshot.data()
                                            as Map<String, dynamic>;
                                        if (mounted) {
                                          setState(() {
                                            userName = userData['name'];
                                          });
                                        }
                                      }
                                    }

                                    fetchUserName();
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('name', userName!);
                                    //Navigat to home page Or Admin Page
                                    if (email!.trim() == 'admin@gg.com') {
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        AdminPanel.id,
                                        (Route<dynamic> route) => false,
                                      );
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        MainPage.id,
                                        (Route<dynamic> route) => false,
                                      );
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    log(e.code);
                                    // Catch Ex and show messages for the user
                                    if (e.code == 'invalid-credential') {
                                      // ignore: use_build_context_synchronously
                                      showMessage(context,
                                          'Wrong password or email provided.');
                                    } else if (e.code == 'invalid-email') {
                                      // ignore: use_build_context_synchronously
                                      showMessage(
                                          context, 'invalid email format.');
                                    } else if (e.code == 'too-many-requests') {
                                      // ignore: use_build_context_synchronously
                                      showMessage(context,
                                          'Too many requests, try later');
                                    }
                                  } catch (e) {
                                    log(e.toString());

                                    // ignore: use_build_context_synchronously
                                    showMessage(context, e.toString());
                                  }
                                  isLoading = false;
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 800),
                            duration: const Duration(milliseconds: 900),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account ?',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, SignUpView.id);
                                  },
                                  child: const Text(
                                    'SignUp',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
