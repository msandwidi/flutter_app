import 'package:flutter/material.dart';

class ShoverlingRequestForm extends StatefulWidget {
  @override
  _ShoverlingRequestFormState createState() => _ShoverlingRequestFormState();
}

class _ShoverlingRequestFormState extends State<ShoverlingRequestForm> {
  bool isRecurrent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shoveling Request"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
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
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                       elevation: isRecurrent ? 0 : 3.0,
                      color: isRecurrent ? Colors.blueAccent : null,
                      child: Text(
                        "One Time",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: isRecurrent ? Colors.white : null,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isRecurrent = true;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      elevation: !isRecurrent ? 0 : 3.0,
                      color: !isRecurrent ? Colors.blueAccent : null,
                      child: Text(
                        "Recurrent",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: !isRecurrent ? Colors.white : null,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isRecurrent = false;
                        });
                      },
                    ),
                  ),
                ],
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
          ),
        ),
      ),
    );
  }
}

Widget getFormContent(context, isRecurrent) {
  return ListView(
    children: <Widget>[
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
      Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: "Description",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
      Checkbox(
        value: isRecurrent,
        onChanged: (bool checked) {
          if (isRecurrent)
            isRecurrent = false;
          else
            isRecurrent = true;
        },
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
