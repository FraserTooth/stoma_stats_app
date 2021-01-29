import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class ChangeModel {

  Future<void> addChange(String stoma_type, DateTime timestamp, int number) {
    CollectionReference changes = FirebaseFirestore.instance
      .collection('users')
      .doc(auth.currentUser.uid)
      .collection('changes');
    return changes
        .add({"type": stoma_type, "timestamp": timestamp, "number": number})
        .then((value) => print("Change Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
