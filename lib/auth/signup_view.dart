import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/auth/signin_view.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/components/my_button.dart';
import 'package:flutter_samples/components/normal_text_form_filed.dart';
import 'package:flutter_samples/components/pw_text_form_filed.dart';
import 'package:flutter_samples/components/show_snack_bar.dart';
import 'package:flutter_samples/helper/save_user_data.dart';
import 'package:flutter_samples/pages/main_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static String id = 'SignUpVIew';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email, password, confirmPassword, username;
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
                      height: 1100,
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
                                    'Who Is Here? 👀',
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
                                    'Welcome to GenGoals.',
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
                                    'Join to our family now!',
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
                              'Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // Email Text Filed
                          NormaltextFormFiled(
                            onChanged: (data) {
                              username = data;
                            },
                            label: 'Your Name',
                            icon: const Icon(EvaIcons.email),
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
                          const SizedBox(
                            height: 20,
                          ),
                          FadeInDown(
                            delay: const Duration(milliseconds: 500),
                            duration: const Duration(milliseconds: 600),
                            child: const Text(
                              'Confirm Password',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // Password Form Filed
                          PwTextFormField(
                            onChanged: (data) {
                              confirmPassword = data;
                            },
                            label: 'Confirm Password',
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
                                  try {
                                    //creat new account
                                    if (password == confirmPassword) {
                                      CollectionReference users =
                                          FirebaseFirestore.instance
                                              .collection('users');
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                        email: email!.trim(),
                                        password: password!.trim(),
                                      );
                                      saveUserData(
                                        email: email!,
                                        password: password!,
                                        name: username!,
                                        points: 0,
                                        tasks: 0,
                                        videosWathsed: 0,
                                        quizPlayed: 0,
                                        user:
                                            FirebaseAuth.instance.currentUser!,
                                      );
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString('name', username!);

                                      //Navigate to HomePage
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        MainPage
                                            .id, // Route name for your login page
                                        (Route<dynamic> route) =>
                                            false, // Remove all routes
                                      );
                                    } else {
                                      showMessage(
                                          context, "Password Doesn't match");
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      // ignore: use_build_context_synchronously
                                      showMessage(context,
                                          'The password provided is too weak.');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      // ignore: use_build_context_synchronously
                                      showMessage(context,
                                          'The account already exists for that email.');
                                    } else if (e.code == 'invalid-email') {
                                      // ignore: use_build_context_synchronously
                                      showMessage(
                                          context, 'invalid email format.');
                                    }
                                  } catch (e) {
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
                                    Navigator.pushNamed(context, SignInView.id);
                                  },
                                  child: const Text(
                                    'SignIn',
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
