import 'package:flutter/material.dart';
import 'package:flutter_samples/admin/admin_chat_page.dart';
import 'package:icons_plus/icons_plus.dart';

class AdminChatCard extends StatelessWidget {
  const AdminChatCard({super.key, required this.userEmail});
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //show ChatPage with the user with user id
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminChatPage(userEmail: userEmail),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              //dark shabow
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(6, 6),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              //light shabow
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-6, -6),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(EvaIcons.person_done),
                const SizedBox(
                  width: 25,
                ),
                Text(
                  userEmail,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
