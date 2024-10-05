// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_samples/helper/open_url.dart';
import 'package:flutter_samples/helper/web_view.dart';
import 'package:flutter_samples/widgets/summary.dart';
import 'package:flutter_samples/widgets/quiz_questions.dart';
import 'package:flutter_samples/widgets/uplode_task.dart';
import 'package:flutter_samples/widgets/video_player.dart';
import 'package:icons_plus/icons_plus.dart';

class CourseInfoPage extends StatefulWidget {
  const CourseInfoPage(
      {super.key,
      required this.mainColor,
      required this.darkColor,
      required this.taskDescription,
      required this.title,
      required this.about,
      required this.icon,
      required this.sumImage,
      this.videoUrl});
  final Color mainColor;
  final Color darkColor;
  final String taskDescription;
  final String title;
  final String about;
  final BoxIconData icon;
  final String sumImage;
  final String? videoUrl;
  @override
  State<CourseInfoPage> createState() => _CourseInfoPageState();
}

class _CourseInfoPageState extends State<CourseInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100,
        // leading: Icon(
        //   Icons.arrow_back,
        //   size: 30,
        // ),
        backgroundColor: Color(0x00FFFFFF),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(color: widget.mainColor),
                  child: Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text("4")
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.access_time),
                                  Text(
                                    " 3 min",
                                    style: TextStyle(
                                      color: widget.mainColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SummaryPage(
                                        mainColor: widget.mainColor,
                                        sumImage: widget.sumImage,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.0, horizontal: 18.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Color(0xFFE8F1FF),
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                                color: Color(0xFFE8F1FF),
                                borderRadius: BorderRadius.circular(25)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 60),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xFFF5F9FF),
                                  ),
                                  child: Text(
                                    "About",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UplodeTask(
                                            mainColor: widget.mainColor,
                                            taskDescription:
                                                widget.taskDescription,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 42.5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Text(
                                        "⭐Task⭐",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(widget.about),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 315,
                right: 35,
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: widget.darkColor),
                  child: IconButton(
                    icon: Icon(BoxIcons.bx_video_plus),
                    iconSize: 30,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomVideoPlayer(
                              title: widget.title,
                              description: widget.about,
                              videoUrl: widget.videoUrl ??
                                  'https://www.youtube.com/watch?v=58F6Kmx_yfg'),
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: 40.0, left: 40.0, top: 0.0, bottom: 15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: widget.mainColor,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34.5),
                child: Text(
                  "Take Your Quiz  +3 star",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, "/profile")
                  if (widget.title == 'Ozone layer') {
                    FlutterWebView(
                        url:
                            ' https://quizizz.com/admin/quiz/6700d3969083b03c55da0fa9');
                  } else {
                    FlutterWebView(
                        url:
                            '  https://quizizz.com/admin/quiz/6700d5f780ea165405967033');
                  }
                },
                padding: EdgeInsets.all(0),
                iconSize: 25,
                icon: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.arrow_forward,
                    color: widget.mainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
