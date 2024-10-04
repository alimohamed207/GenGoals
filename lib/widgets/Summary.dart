import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/helper/user_data_help.dart';
import 'package:flutter_samples/pages/main_page.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key, required this.mainColor});
  final Color mainColor;
  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  int _points = 0;

  @override
  void initState() {
    super.initState();
    fetchUserPoints();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(34.0),
        child: Container(
          height: 650,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(37),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFFE8F1FF),
                      border: Border.all(
                        color: widget.mainColor,
                        width: 2,
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    "Summary",
                    style: TextStyle(
                      color: widget.mainColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Image.asset(
                "assets/images/Biology-Grade-12-samp-51.png",
                height: 520,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: 40.0, left: 40.0, top: 0.0, bottom: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: widget.mainColor,
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.5),
                child: SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Return Home",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              Container(
                  child: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, MainPage.id, (Route<dynamic> route) => false);
                  updatePoints(
                      FirebaseAuth.instance.currentUser!.uid, _points + 15);
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
