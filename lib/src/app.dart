import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './views/home.dart';
import './views/login.dart';

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return bad();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return app();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return loading();
      },
    );
  }

  Widget app() {
    return MaterialApp(
      title: 'Stoma Stats',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(title: 'Stoma Stats'),
    );
  }

  Widget bad() {
    return Center(
      child: Text("Something went wrong...", textDirection: TextDirection.ltr),
    );
  }

  Widget loading() {
    return Center(
      child: Text("Loading...", textDirection: TextDirection.ltr),
    );
  }
}
