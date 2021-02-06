import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

/// Supply Model Structure
/// {
///   id: uuid
///   name: string
///   location: string
///   amount: int
///   last_updated: datetime
/// }

class SuppliesModel {
  Future<void> create({String description, int number, String location}) {
    CollectionReference supplies = _firestore
        .collection('users')
        .doc(auth.currentUser.uid)
        .collection('supplies');

    return supplies
        .add({
          'name': description,
          'location': location,
          'amount': number,
          "last_updated": new DateTime.now()
        })
        .then((value) => print("New Supply Added"))
        .catchError((error) => print("Failed to add supply: $error"));
  }

  Stream<QuerySnapshot> list() {
    CollectionReference supplies = _firestore
        .collection('users')
        .doc(auth.currentUser.uid)
        .collection('supplies');
    return supplies.snapshots(includeMetadataChanges: false);
  }

  Future<void> update({String id, int change}) {
    return _firestore
        .runTransaction((transaction) async {
          DocumentReference supplyRef = _firestore
              .collection('users')
              .doc(auth.currentUser.uid)
              .collection('supplies')
              .doc(id);
          DocumentSnapshot snapshot = await transaction.get(supplyRef);
          int supplyNumber = snapshot.get('amount');
          transaction.update(supplyRef, {
            'amount': supplyNumber + change,
            "last_updated": new DateTime.now()
          });
        })
        .then((value) => print("Supply Updated Added"))
        .catchError((error) => print("Failed to update supply: $error"));
  }
}
