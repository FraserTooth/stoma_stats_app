import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stoma_stats/src/model/change.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  final _formKey = GlobalKey<FormState>();
  final typeController = TextEditingController();
  final timestampController = TextEditingController();
  final numberController = TextEditingController();

  ChangeModel change = new ChangeModel();

  @override
  void dispose() {
    typeController.dispose();
    timestampController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            controller: typeController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(labelText: 'Enter your Stoma Type'),
          ),
          TextFormField(
            controller: numberController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter an amount';
              }
              return null;
            },
            inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(labelText: 'Enter number used'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                change.add(typeController.text, new DateTime.now(), int.parse(numberController.text));
              }
            },
            child: Text('Submit'),
          ),
        ]));
  }
}
