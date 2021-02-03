import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stoma_stats/src/model/change.dart';
import 'package:intl/intl.dart';

class LatestChange extends StatelessWidget {
  ChangeModel changes = new ChangeModel();

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: changes.latest(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text("No Previous Date Listed");
          final DateTime timestamp =
              snapshot.data.docs.first['timestamp'].toDate();
          return new Text(_getDateString(timestamp));
        });
  }

  String _getDateString(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm');
    final String formatted = formatter.format(date);
    return formatted;
  }
}
