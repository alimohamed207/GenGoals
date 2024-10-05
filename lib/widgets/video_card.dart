import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/helper/open_url.dart';
import 'package:flutter_samples/helper/user_data_help.dart';
import 'package:flutter_samples/widgets/video_player.dart';
import 'package:icons_plus/icons_plus.dart';

class VideoCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String info;
  final String link;

  const VideoCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.info,
    required this.link,
  });

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  int _points = 0;
  int _videoWatched = 0;
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
      if (mounted) {
        setState(() {
          _points = userData['points'];
          _videoWatched = userData['videosWathsed'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Customize the card's dimensions and styling as needed
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              width: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ),
          ),
          // Title and info section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.info,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        updatePoints(FirebaseAuth.instance.currentUser!.uid,
                            _points + 10);
                        updateStatistics(
                          userId: FirebaseAuth.instance.currentUser!.uid,
                          changedData: 'videosWathsed',
                          newValue: _videoWatched + 1,
                        );
                        if (widget.link.contains('spotify')) {
                          openBrowserWebView(widget.link);
                        } else {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return CustomVideoPlayer(
                                title: widget.title,
                                description: widget.info,
                                videoUrl: widget.link,
                              );
                            },
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentColor,
                        foregroundColor: Colors.white,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(BoxIcons.bx_play_circle),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Play'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Play button section
        ],
      ),
    );
  }
}
