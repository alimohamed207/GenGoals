import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/helper/user_data_help.dart';
import 'package:image_picker/image_picker.dart';

class UplodeTask extends StatefulWidget {
  const UplodeTask({super.key, this.mainColor, required this.taskDescription});
  final Color? mainColor;
  final String taskDescription;
  @override
  State<UplodeTask> createState() => _UplodeTaskState();
}

class _UplodeTaskState extends State<UplodeTask> {
  String _image = '';
  String _text = '';
  int _points = 0;
  int _tasks = 0;

  @override
  void initState() {
    super.initState();
    fetchUserPoints();
  }

  Future<void> fetchUserPoints() async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle user not being logged in
      return;
    }

    final userDocRef = firestore.collection('users').doc(user.uid);
    final userSnapshot = await userDocRef.get();

    if (userSnapshot.exists) {
      final userData = userSnapshot.data() as Map<String, dynamic>;
      if (mounted) {
        setState(() {
          _points = userData['points'];
          _tasks = userData['tasks'];
        });
      }
    }
  }

  Future<String> uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef =
          FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } else {
      throw Exception('No image selected');
    }
  }

//save new task in firebase
  Future<void> saveTask(String imageUrl, String text) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference userTasks = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('tasks');
      await userTasks.add({
        'imageUrl': imageUrl,
        'text': text,
        'task': widget.taskDescription,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } else {
      throw Exception('No user signed in');
    }
  }

//uplode task
  Future<void> uploadTask(String text) async {
    try {
      String imageUrl = await uploadImage();
      await saveTask(imageUrl, text);
      throw ('Task uploaded successfully');
    } catch (e) {
      throw ('Failed to upload task: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Task Description :",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Text(widget.taskDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Upload the task",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                GestureDetector(
                  onTap: () async {
                    _image = await uploadImage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            spreadRadius: -1,
                          )
                        ]),
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_upload,
                          size: 48,
                          color: widget.mainColor ?? AppColors.accentColor,
                        ),
                        const Text("Click here to upload")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Add a note",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          spreadRadius: -1,
                        )
                      ]),
                  child: TextField(
                    onChanged: (value) {
                      _text = value;
                    },
                    minLines: 4,
                    maxLines: 4,
                    decoration: const InputDecoration(
                        hintText: "Would you like to add anything ?",
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                saveTask(_image, _text);
                updatePoints(
                    FirebaseAuth.instance.currentUser!.uid, _points + 10);
                updateStatistics(
                  userId: FirebaseAuth.instance.currentUser!.uid,
                  changedData: 'tasks',
                  newValue: _tasks + 1,
                );

                Navigator.popUntil(context, ModalRoute.withName("/"));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: widget.mainColor ?? AppColors.accentColor,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      iconSize: 32,
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.arrow_forward,
                          color: widget.mainColor ?? AppColors.accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
