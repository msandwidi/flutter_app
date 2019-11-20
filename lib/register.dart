import 'package:flutter/material.dart';
import './login.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: getFormContent(context),
      ),
    );
  }
}

Widget getFormContent(context) {
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
      Container(
        margin: EdgeInsets.only(top: 5.0),
        child: RaisedButton(
          elevation: 0.0,
          color: Colors.white,
          child: Text(
            "Login",
            style: TextStyle(color: Colors.lightBlue, fontSize: 18.0),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    ],
  );
}
