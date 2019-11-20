import 'package:flutter/material.dart';
import './home.dart';
import './auth_user_home.dart';
import './my_order_list.dart';
import './select_service.dart';
import './login.dart';
import './shoveling_request.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Shoveler',
      home: Material(
        color: Colors.blueAccent,
        child: SelectService(),
      ),
    );
  }
}
