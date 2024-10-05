import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/helper/calculate_rank.dart';
import 'package:flutter_samples/models/user_model.dart';
import 'package:flutter_svg/svg.dart';

class UserLeaderboardCards extends StatefulWidget {
  const UserLeaderboardCards({super.key});

  @override
  State<UserLeaderboardCards> createState() => _UserLeaderboardCardsState();
}

class _UserLeaderboardCardsState extends State<UserLeaderboardCards> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  List<UserModel> leaderboard = [];
  @override
  void initState() {
    super.initState();
    getLeaderboard();
  }

  Future<void> getLeaderboard() async {
    final querySnapshot = await users.orderBy('points', descending: true).get();
    leaderboard = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return UserModel(
        name: data['name'],
        points: data['points'],
      );
    }).toList();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: leaderboard.length,
      itemBuilder: (context, index) {
        final user = leaderboard[index];
        calculateRank(user, leaderboard);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F9FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 210,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF5F9FF),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xFFE6E6E6), width: 1.5)),
                          alignment: Alignment.center,
                          child: Text("${index + 1}"),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Positioned(
                                // top: 85,
                                // left: ,
                                child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.purple,
                              child: Image.asset("assets/images/user.png"),
                            )),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text("${user.points} Points"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  0 <= index && index <= 2
                      // ? Text("${index + 1}")
                      ? SvgPicture.asset("assets/images/medal${index + 1}.svg")
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        );
      },
    );
  }
}
