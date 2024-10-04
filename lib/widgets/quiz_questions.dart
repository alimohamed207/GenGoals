import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/helper/user_data_help.dart';
import 'package:flutter_samples/pages/main_page.dart';
import 'package:flutter_svg/svg.dart';

class QuizQuestions extends StatefulWidget {
  const QuizQuestions({super.key, required this.mainColor});
  final Color mainColor;

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  // ignore: unused_field
  int _points = 0;
  // ignore: unused_field
  int _quizPlayed = 0;
  @override
  void initState() {
    super.initState();
    fetchUserPoints();
    fetchUserQuizPlayed();
  }

//points
  Future<void> fetchUserPoints() async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle user not being logged in
      return;
    }

    final userDocRef = firestore.collection('users').doc(user.uid);
    final userSnapshot = await userDocRef.get();

    if (userSnapshot.exists) {
      final userData = userSnapshot.data() as Map<String, dynamic>;
      setState(() {
        _points = userData['points'];
      });
    }
  }

//quizPlayed
  Future<void> fetchUserQuizPlayed() async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle user not being logged in
      return;
    }

    final userDocRef = firestore.collection('users').doc(user.uid);
    final userSnapshot = await userDocRef.get();

    if (userSnapshot.exists) {
      final userData = userSnapshot.data() as Map<String, dynamic>;
      setState(() {
        _quizPlayed = userData['quizPlayed'];
      });
    }
  }

  @override
  // ignore: override_on_non_overriding_member
  var value = 1;
  @override
  Widget build(BuildContext context) {
    Valuechange(i) {
      print(i);
      print(value);
      value = i;
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: 350,
          width: 360,
          child: Column(
            children: [
              const Text("Select the Payment Methods you Want to Use"),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: value,
                          onChanged: (i) {
                            setState(() {
                              Valuechange(i);
                            });
                          }),
                      const Text("Paypal")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: value,
                          onChanged: (i) {
                            setState(() {
                              Valuechange(i);
                            });
                          }),
                      const Text("Paypal")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Radio(
                          value: 3,
                          groupValue: value,
                          onChanged: (i) {
                            setState(() {
                              Valuechange(i);
                            });
                          }),
                      const Text("Paypal")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Radio(
                          value: 4,
                          groupValue: value,
                          onChanged: (i) {
                            setState(() {
                              Valuechange(i);
                            });
                          }),
                      const Text("Paypal")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: 40.0, left: 40.0, top: 0.0, bottom: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: widget.mainColor,
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.5),
                child: SizedBox(
                  width: 190,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next Question",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  child: IconButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            height: 541,
                            width: 400,
                            padding: const EdgeInsets.all(40),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/ICON.svg",
                                  height: 250,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "10/10",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Congratulations! 🎉 You nailed it",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                SizedBox(
                                  width: 210,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(70),
                                      color: widget.mainColor,
                                    ),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: SizedBox(
                                            // width: 190,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Return Home",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                            child: IconButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const MainPage(),
                                              ),
                                            );
                                            updatePoints(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                _points + 20);
                                            updateStatistics(
                                                userId: FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                newValue: _quizPlayed + 1,
                                                changedData: 'quizPlayed');
                                          },
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          iconSize: 25,
                                          icon: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color: widget.mainColor,
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                },
                padding: const EdgeInsets.all(0),
                iconSize: 25,
                icon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.arrow_forward,
                    color: widget.mainColor,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
