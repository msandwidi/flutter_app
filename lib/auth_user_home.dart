import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import './select_service.dart';
import './my_order_list.dart';
import './my_message_list.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SelectService()));
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    'Smart Shoveler',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Dashboard'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Orders'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderList()));
                  },
                ),
                ListTile(
                  title: Text('Messages'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MessageList()));
                  },
                ),
              ],
            ),
          ),
          body: getUserHomePageContent(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.more_vert),
            onPressed: null,
            tooltip: "Options",
          ),
        ));
  }
}

Widget getUserHomePageContent() {
  return Text("UserHomePage content");
}
