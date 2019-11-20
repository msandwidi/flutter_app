import 'package:flutter/material.dart';

class MyLoadingSpinner extends StatefulWidget {
  @override
  _MyLoadingSpinnerState createState() => _MyLoadingSpinnerState();
}

class _MyLoadingSpinnerState extends State<MyLoadingSpinner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator()
    );
  }
}
