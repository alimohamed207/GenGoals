import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:lottie/lottie.dart';

class ChatCard extends StatelessWidget {
  const ChatCard(
      {super.key,
      required this.imagePath,
      required this.label,
      required this.text,
      required this.onTap,
      this.imageHeight});
  final String imagePath;
  final String label;
  final String text;
  final double? imageHeight;

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
          gradient: const RadialGradient(
            center: Alignment(1.0, 0.5), // Center of the radial gradient
            radius: 15, // Radius of the gradient (from 0.0 to 1.0)
            colors: [AppColors.accentColor, Color.fromARGB(255, 124, 195, 216)],
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          // cute image
          Lottie.asset(imagePath, height: imageHeight ?? 120),
          const SizedBox(width: 30),
          // how do you feel + start chat button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Center(
                      child: Text(
                        'Chat Now',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
