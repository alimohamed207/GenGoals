import 'package:flutter/material.dart';
import 'package:flutter_samples/pages/courses/course_info.dart';
import 'package:icons_plus/icons_plus.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String info;
  final String bgPath;
  final Color mainColor;
  final Color darkColor;
  final String taskDescription;
  final BoxIconData icon;
  const CourseCard(
      {super.key,
      required this.title,
      required this.info,
      required this.bgPath,
      required this.mainColor,
      required this.darkColor,
      required this.taskDescription,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CourseInfoPage(
                    mainColor: mainColor,
                    darkColor: darkColor,
                    taskDescription: taskDescription,
                    about: info,
                    title: title,
                    icon: icon,
                  )),
        );
      },
      child: Stack(
        children: [
          Image.asset(bgPath),
          Positioned(
            top: 50,
            left: 22,
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    info,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
