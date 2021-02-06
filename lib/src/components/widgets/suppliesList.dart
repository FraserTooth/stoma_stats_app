import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stoma_stats/src/model/supplies.dart';

class SuppliesList extends StatelessWidget {
  SuppliesModel supplies = new SuppliesModel();

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: supplies.list(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text("There are no supplies");
          return new ListView(children: listSupplies(snapshot));
        });
  }

  List listSupplies(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.docs
        .map((doc) => new ListTile(
            title: new Text(doc["name"]), 
            subtitle: new Text(
              "Amount: ${doc["amount"].toString()}\nLocation: ${doc["location"]}"
              )
          )
        )
        .toList();
  }
}