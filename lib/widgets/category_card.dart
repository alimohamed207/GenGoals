import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.onTap,
      required this.label,
      required this.iconData});
  final void Function()? onTap;
  final String label;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColors.accentColor,
          ),
          height: 100,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Article lapel
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //Article image
              Icon(
                iconData,
                size: 120,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
