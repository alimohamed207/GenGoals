import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_samples/widgets/simple_appbar.dart';
import 'package:flutter_samples/helper/collection_manger.dart';
import 'package:flutter_samples/helper/get_user_email.dart';
import 'package:flutter_samples/models/message_model.dart';

// ignore: must_be_immutable
class InstructorChatPage extends StatefulWidget {
  const InstructorChatPage({super.key});
  static String id = 'ChatPage';

  @override
  State<InstructorChatPage> createState() => _InstructorChatPageState();
}

class _InstructorChatPageState extends State<InstructorChatPage> {
  final _controller = ScrollController();
  CollectionReference messages =
      FirebaseCollectionManager().getMessagesCollection();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool isSender = true;
    var email = getCurrentUserEmail();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SimpleAppBar(),
      ),
      body: StreamBuilder(
        stream: messages.orderBy('timestamp', descending: true).snapshots(),
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
                  messageBarColor: AppColors.whiteColor,
                  onSend: (data) {
                    messages.add(
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
