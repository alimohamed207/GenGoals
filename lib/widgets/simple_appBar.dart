import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ), // Replace with your desired icon
        onPressed: () {
          // Navigate back using the custom route
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      title: const Text(
        'Gen Goals',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
