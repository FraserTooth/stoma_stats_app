import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stoma_stats/src/components/forms/change.dart';
import 'package:stoma_stats/src/model/change.dart';

// Widgets
import 'package:stoma_stats/src/components/widgets/latestChange.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChangeModel changes = new ChangeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: body());
  }

  void changeStoma() {
    changes.add("Dansac", new DateTime.now(), 1);
  }

  Widget body() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Latest Change", style: TextStyle(fontWeight: FontWeight.bold),),
        LatestChange(),
        ChangeForm(),
      ],
    ));
  }
}
