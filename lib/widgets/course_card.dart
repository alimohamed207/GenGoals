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
  final String sumImage;
  final String? videoUrl;
  List<String> loackedLessonList = [
    'Sustainable fisheries or\nWater filtration.',
    'Biodiversity loss',
    'Technical systems',
  ];
  CourseCard(
      {super.key,
      required this.title,
      required this.info,
      required this.bgPath,
      required this.mainColor,
      required this.darkColor,
      required this.taskDescription,
      required this.icon,
      required this.sumImage,
      this.videoUrl});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (loackedLessonList.contains(title)) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('✨Not Enough Points✨'),
                content:
                    const Text('You need more points to open this lesson.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
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
                      sumImage: sumImage,
                      videoUrl: videoUrl,
                    )),
          );
        }
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
                  SizedBox(
                    width: 210,
                    child: Text(
                      info,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 2,
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
