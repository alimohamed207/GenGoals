import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:image_picker/image_picker.dart';

class UplodeTask extends StatefulWidget {
  const UplodeTask({super.key, this.mainColor, required this.taskDescription});
  final Color? mainColor;
  final String taskDescription;
  @override
  State<UplodeTask> createState() => _UplodeTaskState();
}

class _UplodeTaskState extends State<UplodeTask> {
  File? _image;
  // String _imageUrl = ''; // Initialize image URL to an empty string
  // String _note = ''; // Initialize note to an empty string

  // Future<void> _uploadImageToFirebase() async {
  //   if (_image == null) {
  //     // Handle case where no image is selected
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Please select an image to upload.'),
  //       ),
  //     );
  //     return;
  //   }

  //   try {
  //     await Firebase.initializeApp(); // Initialize Firebase if not already done

  //     final storage = FirebaseStorage.instance;
  //     final reference = storage.ref().child('tasks/${DateTime.now().millisecondsSinceEpoch}.jpg'); // Create a unique path for the image
  //     final uploadTask = reference.putFile(_image!);

  //     setState(() {
  //       // Update UI to show upload progress (optional)
  //     });

  //     final snapshot = await uploadTask;
  //     _imageUrl = await snapshot.ref.getDownloadURL();
  //   } on FirebaseException catch (e) {
  //     // Handle Firebase errors
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error uploading image: ${e.message}'),
  //       ),
  //     );
  //   }
  // }

  // Future<void> _saveToFirestore() async {
  //   if (_imageUrl.isEmpty) {
  //     // Handle case where image upload failed or no image was selected
  //     return;
  //   }

  //   // Replace with your actual Firestore reference initialization
  //   // final firestore = FirebaseFirestore.instance;
  //   // final collection = firestore.collection('tasks');

  //   // Assuming a collection named 'tasks' with fields 'imageUrl' and 'note'
  //   // collection.add({'imageUrl': _imageUrl, 'note': _note});

  //   // Show success message after saving (optional)
  // }

  // _pickimage(ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: source);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);

  //     });
  //   }
  // }

  _pickimage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
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
                  onTap: () {
                    _pickimage(ImageSource.gallery);
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
                      print(value);
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
            Container(
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
                  Container(
                      child: IconButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName("/"));
                    },
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
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
