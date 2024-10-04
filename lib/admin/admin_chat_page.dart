import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/helper/collection_manger.dart';
import 'package:flutter_samples/helper/get_user_email.dart';
import 'package:flutter_samples/models/message_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

// ignore: must_be_immutable
class AdminChatPage extends StatefulWidget {
  const AdminChatPage({super.key, required this.userEmail});
  static String id = 'AdminChatPage';
  final String userEmail;

  @override
  State<AdminChatPage> createState() => _AdminChatPageState();
}

class _AdminChatPageState extends State<AdminChatPage> {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool isSender = true;
    var email = getCurrentUserEmail();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('DashBoard'),
      ),
      body: StreamBuilder(
        stream: FirebaseCollectionManager()
            .getMessagesForUser(widget.userEmail)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    reverse: true,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      if (email == messagesList[index].id) {
                        isSender = true;
                        return BubbleSpecialThree(
                          text: messagesList[index].messageText,
                          color: AppColors.primaryColor,
                          tail: true,
                          isSender: true,
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        );
                      } else {
                        isSender = false;
                        return BubbleSpecialThree(
                          text: messagesList[index].messageText,
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
                  onSend: (data) {
                    FirebaseCollectionManager()
                        .getMessagesForUser(widget.userEmail)
                        .add(
                      {
                        'message': data,
                        'timestamp': FieldValue.serverTimestamp(),
                        'id': email,
                      },
                    );
                    _controller.animateTo(
                      0.0,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  sendButtonColor: AppColors.primaryColor,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const SnackBar(
                content: Text('Therw was an error, try again later'));
          } else {
            return const Center(
              child: SpinKitChasingDots(
                color: AppColors.primaryColor,
                size: 50.0,
              ),
            );
          }
        },
      ),
    );
  }
}
