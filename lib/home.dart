import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shoveler/select_service.dart';
import './auth_user_home.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final prefs = SharedPreferences.getInstance();
    prefs.then((myprefs) => {
          if (myprefs.getBool("isLoggedIn"))
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserHomePage()))
            }
          else 
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SelectService()))
            }
        });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WelcomeText(),
            BrandText(),
            Container(
              margin: EdgeInsets.only(
                top: 25.0,
              ),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            )
          ],
        ));
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

class BrandText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Smart Shoveler",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 25.0,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
