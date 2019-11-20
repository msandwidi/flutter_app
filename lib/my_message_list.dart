import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: getListOfOrders(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
        tooltip: "New Message",
      ),
    );
  }
}

ListView getListOfOrders() {
  int count = 0;
  return ListView.builder(
    itemCount: count,
    itemBuilder: (BuildContext context, int position) {
      return Card(
        color: Colors.white,
        elevation: 3.0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          title: Text("Dummy title"),
          subtitle: Text("Dummy subtitle"),
          trailing: Icon(
            Icons.delete_forever,
          ),
          onTap: () {
            debugPrint("order tap");
          },
        ),
      );
    },
  );
}
