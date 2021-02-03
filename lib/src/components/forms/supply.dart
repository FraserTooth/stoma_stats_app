import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Models
import 'package:stoma_stats/src/model/supplies.dart';

class SupplyForm extends StatefulWidget {
  @override
  _SupplyFormState createState() => _SupplyFormState();
}

class _SupplyFormState extends State<SupplyForm> {
  final _formKey = GlobalKey<FormState>();
  final typeController = TextEditingController();
  final timestampController = TextEditingController();
  final numberController = TextEditingController();

  SuppliesModel supplies = new SuppliesModel();

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
            decoration: InputDecoration(labelText: 'Enter amount'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                supplies.create(typeController.text, int.parse(numberController.text));
              }
            },
            child: Text('Register Supplies'),
          ),
        ]));
  }
}
