import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stoma_stats/src/components/forms/change.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _previousChange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: body());
  }

  String getDateString(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');
    final String formatted = formatter.format(date);
    return formatted;
  }

  void updateChangeDate() {
    setState(() {
      _previousChange = new DateTime.now();
    });
  }

  Widget body() {
    final displayString = _previousChange != null
        ? getDateString(_previousChange)
        : "No Previous Date Listed";

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(displayString),
        ElevatedButton(
          child: Text("Changed Stoma"),
          onPressed: updateChangeDate,
        ),
        ChangeForm(),
      ],
    ));
  }
}
