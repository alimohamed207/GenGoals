import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updatePoints(String userId, int newPoints) async {
  final firestore = FirebaseFirestore.instance;

  try {
    final userDocRef = firestore.collection('users').doc(userId);
    await userDocRef.update({'points': newPoints});
  } catch (e) {
    // Handle errors
    throw ('Error updating points: $e');
  }
}

Future<void> updateStatistics(
    {required String userId,
    required int newValue,
    required String changedData}) async {
  final firestore = FirebaseFirestore.instance;

  try {
    final userDocRef = firestore.collection('users').doc(userId);
    await userDocRef.update({changedData: newValue});
  } catch (e) {
    // Handle errors
    throw ('Error updating changedData: $e');
  }
}

// class UserDataHelper {
//   static const String _sharedPrefsKey = 'userData';
//   final String userId;

//   UserDataHelper({required this.userId});
//   Future<void> saveUserData(String name, int points) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('name', name);
//     prefs.setInt('points', points);

//     // Update Firestore data
//     final userRef = FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId); // Replace 'userId' with the actual user ID
//     await userRef.set({
//       'name': name,
//       'points': points,
//     });
//   }

//   Future<void> loadUserData(Function(String name, int points) callback) async {
//     final prefs = await SharedPreferences.getInstance();
//     final name = prefs.getString('name') ?? '';
//     final points = prefs.getInt('points') ?? 0;

//     if (name.isNotEmpty && points > 0) {
//       callback(name, points);
//     } else {
//       // Retrieve data from Firestore
//       final userRef = FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId); // Replace 'userId' with the actual user ID
//       final snapshot = await userRef.get();

//       if (snapshot.exists) {
//         final firebaseName = snapshot.data()!['name'] as String;
//         final firebasePoints = snapshot.data()!['points'] as int;

//         saveUserData(firebaseName, firebasePoints);
//         callback(firebaseName, firebasePoints);
//       }
//     }
//   }
// }
