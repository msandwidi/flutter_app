import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: getListOfOrders(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
        tooltip: "New Request",
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
