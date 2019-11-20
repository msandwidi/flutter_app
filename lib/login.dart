import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import './select_service.dart';
import './register.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

import './auth_user_home.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
          context, MaterialPageRoute(builder: (context) => SelectService()));
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) return "Email is Required";
                    return "";
                  },
                  controller: emailController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) return "Password is Required";
                    return "";
                  },
                  controller: passwordController,
                ),
              ),
              Container(
                height: 60.0,
                margin: EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  elevation: 2.0,
                  color: Colors.deepOrange,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  onPressed: () {
                    setState(() {
                      handleSignin();
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: RaisedButton(
                  elevation: 0.0,
                  color: Colors.white,
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 18.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterForm()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleSignin() async {
    const LOGIN_URL =
        'https://smartshoverlerapi.herokuapp.com/api/v1/users/account/login';

    //get data from form
    String email = emailController.text;
    String password = passwordController.text;

    //build request body
    var data = Map<String, String>();
    data["email"] = email;
    data["password"] = password;

    //send request
    final response = await http.post(LOGIN_URL, body: data);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      Map<String, dynamic> user = json.decode(response.body)['user'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("authToken", body["token"]);
      prefs.setString("userEmail", user["email"]);
      prefs.setString("userId", user["_id"]);
      prefs.setBool("isLoggedIn", true);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserHomePage()));
    } else
      return null;
  }
}
