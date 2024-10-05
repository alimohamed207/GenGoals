import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/pages/chat/AI_chat_page.dart';
import 'package:flutter_samples/pages/chat/community_chat.dart';
import 'package:flutter_samples/pages/chat/instructor_chat_page.dart';
import 'package:flutter_samples/widgets/chat_card.dart';
import 'package:flutter_samples/widgets/custom_appBar.dart';
import 'package:flutter_samples/widgets/section_header.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: CustomAppbar(),
            ),
            const SizedBox(
              height: 30,
            ),
            SectionHeader(
              text: 'Chat List',
              isVisibale: false,
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ChatCard(
                imagePath: 'assets/animation/ai_chat.json',
                label: 'AI SDG Yoda',
                text: 'Learn about the SDGs in a fun and interactive way.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AIChatPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ChatCard(
                imagePath: 'assets/animation/instructor.json',
                label: 'Instructor',
                text: 'Your personal SDG learning assistant.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InstructorChatPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ChatCard(
                imagePath: 'assets/animation/group.json',
                imageHeight: 90,
                label: 'SDGs Community',
                text: 'Connect, chat, and engage with like-minded people.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommunityChatPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
