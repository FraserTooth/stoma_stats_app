import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AddChange extends StatelessWidget {
  final String stoma_type;
  final DateTime timestamp;
  int number;

  AddChange(this.stoma_type, this.timestamp, this.number);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference changes = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser.uid)
        .collection('changes');

    Future<void> addChange() {
      // Call the user's CollectionReference to add a new user
      return changes
          .add({"type": stoma_type, "timestamp": timestamp, "number": number})
          .then((value) => print("Change Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addChange,
      child: Text(
        "Add Change",
      ),
    );
  }
}
