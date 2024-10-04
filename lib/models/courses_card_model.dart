import 'dart:ui';

import 'package:icons_plus/icons_plus.dart';

class CoursesCardModel {
  final String title;
  final String info;
  final String bgPath;
  final Color mainColor;
  final Color darkColor;
  final String taskDescription;
  final BoxIconData icon;

  CoursesCardModel({
    required this.title,
    required this.info,
    required this.bgPath,
    required this.mainColor,
    required this.darkColor,
    required this.taskDescription,
    required this.icon,
  });
}
