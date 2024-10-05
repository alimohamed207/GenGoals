import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/pages/chat/chat_page.dart';
import 'package:flutter_samples/widgets/card.dart';
import 'package:icons_plus/icons_plus.dart';

class StatsCard extends StatefulWidget {
  const StatsCard({
    super.key,
  });

  @override
  State<StatsCard> createState() => _StatsCardState();
}

class _StatsCardState extends State<StatsCard> {
  String? points;
  String? videoWatched;
  String? tasks;
  String? quizes;
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

// point
  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (documentSnapshot.exists) {
        if (mounted) {
          setState(() {
            points = documentSnapshot.get('points').toString();
            quizes = documentSnapshot.get('quizPlayed').toString();
            tasks = documentSnapshot.get('tasks').toString();
            videoWatched = documentSnapshot.get('videosWathsed').toString();
          });
        }
      }
    }
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Padding(
      padding: const material.EdgeInsets.all(10.0),
      child: CardWidget(
        gradient: false,
        button: true,
        width: 360,
        child: material.Column(
          mainAxisAlignment: material.MainAxisAlignment.start,
          children: <material.Widget>[
            material.Padding(
              padding: const material.EdgeInsets.only(bottom: 6.0),
              child: material.GestureDetector(
                child: material.Container(
                  padding: const material.EdgeInsets.fromLTRB(0, 14, 0, 14),
                  decoration: const material.BoxDecoration(
                      gradient: LinearGradient(colors: [
                    AppColors.accentColor,
                    Color.fromARGB(255, 112, 210, 240),
                  ])),
                  child: material.Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: material.Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            points != null ? points! : "",
                            style: const TextStyle(
                                fontFamily: 'Red Hat Display',
                                fontSize: 18,
                                color: Color(0xFFFFFFFF)),
                          ),
                        ),
                        Image.asset(
                          'assets/images/CoinSmall.png',
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  material.Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ChatPage(),
                    ),
                  );
                },
              ),
            ),
            const material.Padding(
              padding: material.EdgeInsets.all(8.0),
              child: material.Text(
                "Statistics",
                overflow: material.TextOverflow.ellipsis,
                maxLines: 2,
                style: material.TextStyle(
                    color: material.Color(0xFF535353),
                    fontFamily: 'Red Hat Display',
                    fontSize: 16),
              ),
            ),
            material.Padding(
              padding: const material.EdgeInsets.symmetric(horizontal: 8.0),
              child: material.Row(
                children: <material.Widget>[
                  const material.Icon(BoxIcons.bx_question_mark, size: 16),
                  material.Text(
                    // ignore: prefer_adjacent_string_concatenation
                    quizes != null ? "${quizes!} Quiz Done" : "" + "Quiz Done",
                    style: const material.TextStyle(
                        color: material.Color(0xFFADADAD),
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  const material.Spacer(),
                  const material.Text(
                    "12 days Streak ",
                    style: material.TextStyle(
                        color: material.Color(0xFFADADAD),
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  const material.Icon(BoxIcons.bxs_flame, size: 16),
                ],
              ),
            ),
            material.Padding(
              padding: const material.EdgeInsets.symmetric(horizontal: 8.0),
              child: material.Row(
                children: <material.Widget>[
                  const material.Icon(BoxIcons.bx_pen, size: 16),
                  material.Text(
                    tasks != null ? "${tasks!} Task Done" : "Task Done",
                    style: const material.TextStyle(
                        color: material.Color(0xFFADADAD),
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  const material.Spacer(),
                  material.Text(
                    videoWatched != null
                        ? "${videoWatched!} Video Watched "
                        : "Video Watched",
                    style: const material.TextStyle(
                        color: material.Color(0xFFADADAD),
                        fontFamily: 'Red Hat Display',
                        fontSize: 10),
                  ),
                  const material.Icon(BoxIcons.bx_video, size: 16),
                ],
              ),
            ),
            const material.Spacer(),
          ],
        ),
      ),
    );
  }
}
