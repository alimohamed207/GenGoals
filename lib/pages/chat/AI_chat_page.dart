import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/models/gemini_message_model.dart';
import 'package:flutter_samples/widgets/simple_appBar.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIChatPage extends StatefulWidget {
  const AIChatPage({super.key});
  static String id = 'GeminiChatBot';

  @override
  State<AIChatPage> createState() => _AIChatPageState();
}

class _AIChatPageState extends State<AIChatPage> {
  static const apiKey = 'AIzaSyB3f-zQnzSSnPz0--uiKlRGmJOGSYdFtno';
  final model =
      GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);
  final List<GeminiMessageModel> messagesList = [];
  final _controller = ScrollController();
  Future<void> sendMessageToGemini() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SimpleAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messagesList.length,
              controller: _controller,
              reverse: true,
              itemBuilder: (context, index) {
                int reversedIndex = messagesList.length - 1 - index;
                final message = messagesList[reversedIndex];
                if (message.isSender == true) {
                  return BubbleSpecialThree(
                    text: message.messasge,
                    color: AppColors.primaryColor,
                    tail: true,
                    isSender: true,
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 16),
                  );
                } else {
                  return BubbleSpecialThree(
                    text: message.messasge,
                    color: const Color.fromARGB(255, 221, 221, 226),
                    tail: true,
                    isSender: false,
                    textStyle: const TextStyle(fontSize: 16),
                  );
                }
              },
            ),
          ),
          MessageBar(
            messageBarColor: AppColors.whiteColor,
            onSend: (data) async {
              _controller.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
              setState(() {
                messagesList.add(
                  GeminiMessageModel(
                    isSender: true,
                    messasge: data,
                  ),
                );
              });

              final content = [Content.text(data)];
              final response = await model.generateContent(content);
              setState(
                () {
                  messagesList.add(
                    GeminiMessageModel(
                      isSender: false,
                      messasge: response.text ?? '',
                    ),
                  );
                },
              );
            },
            messageBarHintText: 'Chat With Yoda AI 😊',
            sendButtonColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
