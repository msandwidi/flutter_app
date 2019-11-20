import 'package:flutter/material.dart';

class BecomeProviderForm extends StatefulWidget {
  @override
  _BecomeProviderFormState createState() => _BecomeProviderFormState();
}

class _BecomeProviderFormState extends State<BecomeProviderForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Become Provider"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: getFormContent(),
      ),
    );
  }
}

Widget getFormContent() {
  return ListView(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: "Address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
      Container(
        height: 60.0,
        margin: EdgeInsets.only(top: 15.0),
        child: RaisedButton(
          elevation: 2.0,
          color: Colors.deepOrange,
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
          onPressed: () {},
        ),
      ),
     
    ],
  );
}
