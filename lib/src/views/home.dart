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

// Pages
import 'package:stoma_stats/src/views/changes.dart';
import 'package:stoma_stats/src/views/supplies.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChangeModel changes = new ChangeModel();
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Changes',
      style: optionStyle,
    ),
    Text(
      'Index 2: Supplies',
      style: optionStyle,
    ),
  ];

  final List<Widget> pages = <Widget>[
    Text(
      "Latest Change",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    ChangesView(),
    SuppliesView()
    ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: body(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cached),
              label: 'Changes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: 'Supplies',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }

  void changeStoma() {
    changes.add("Dansac", new DateTime.now(), 1);
  }

  Widget body() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pages[_selectedIndex]
      ]
    ));
  }
}
