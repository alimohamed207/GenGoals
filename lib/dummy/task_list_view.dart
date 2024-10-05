import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/components/list_view_builder.dart';
import 'package:flutter_samples/models/list_tile_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference tasks = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('tasks');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder<QuerySnapshot>(
          stream: tasks.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ListTileModel> tasksList = [];
              for (var i = 0; i < snapshot.data!.docs.length; i++) {
                tasksList.add(ListTileModel.fromJson(snapshot.data!.docs[i]));
              }
              return ListViewBuilder(
                objectsList: tasksList,
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
          }),
    );
  }
}
