import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/admin/admin_chat_card.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/helper/logout_method.dart';
import 'package:flutter_samples/widgets/section_header.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});
  static String id = 'AdminPanel';

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('DashBoard'),
          actions: [
            IconButton(
                onPressed: () => logout(context),
                icon: const Icon(Icons.logout))
          ],
        ),
        body: FutureBuilder(
            future: users.get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //get users email
                List<String> usersEmail = [];
                usersEmail = snapshot.data!.docs
                    .map((doc) => doc.get('email') as String)
                    .toList();

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/gen_goals_bg.png',
                              height: 200,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SectionHeader(
                            text: 'Chat With Your Students',
                            onPressed: () {},
                            isVisibale: false),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 600,
                          child: ListView.builder(
                            itemCount: usersEmail.length,
                            itemBuilder: (context, index) {
                              return AdminChatCard(
                                userEmail: usersEmail[index],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return const SnackBar(
                    content: Text('opps there was an error, try again later'));
              } else {
                return const Center(
                    child: SpinKitChasingDots(
                  color: AppColors.primaryColor,
                  size: 30,
                ));
              }
            }));
  }
}
