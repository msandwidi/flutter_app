import 'package:flutter/material.dart';
import 'package:smart_shoveler/become_provider_form.dart';
import './lawn_care_request.dart';
import './shoveling_request.dart';
import './my_message_list.dart';
import './my_order_list.dart';

class SelectService extends StatefulWidget {
  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Services")),
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
        //leading: null,
      ),
      body: getContent(context),
    );
  }
}

Widget getContent(BuildContext context) {
  return Column(
    children: <Widget>[
      RaisedButton(
        color: Colors.lightBlue,
        elevation: 2.0,
        child: Text(
          "Show Removal",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ShoverlingRequestForm()));
        },
      ),
      RaisedButton(
        color: Colors.green,
        elevation: 2.0,
        child: Text(
          "Lawn Care",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LawnCareRequestForm()));
        },
      ),
      RaisedButton(
        elevation: 2.0,
        color: Colors.deepOrange,
        child: Text(
          "Become a Provider",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BecomeProviderForm()));
        },
      ),
    ],
  );
}
