import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Models
import 'package:stoma_stats/src/model/change.dart';

// Widgets
import 'package:stoma_stats/src/components/widgets/latestChange.dart';
import 'package:stoma_stats/src/components/widgets/suppliesList.dart';

// Forms
import 'package:stoma_stats/src/components/forms/change.dart';
import 'package:stoma_stats/src/components/forms/supply.dart';

class SuppliesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.65,
          child: SuppliesList()
        ),
        SupplyForm(),
      ],
    ));
  }
}