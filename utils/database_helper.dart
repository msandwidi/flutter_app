import 'dart:async' as prefix0;

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../models/myrequest.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //singleton db helper
  static Database _database;

  String orderTable = "order_table";
  String description = "description";
  String date = "date";
  String orderId = "id";
  String recurent = "recurrent";
  String submitted = "submitted";

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

//database getter
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

//initialize database
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "order.db";
    //open or create database
    var orderDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return orderDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $orderTable($orderId INTEGER PRIMARY KEY AUTOINCREMENT, $date TEXT, $description TEXT, $recurent INTEGER, $submitted INTEGER)");
  }

  //db operation
  Future<List<Map<String, dynamic>>> getOrderMapList() async {
    Database db = await this.database;

    //var result = await db.rawQuery("SELECT * FROM $orderTable order by $date ASC");
    var result = await db.query(orderTable, orderBy: '$date ASC');

    return result;
  }

//insert order
  Future<int> insertOrder(OrderRequest order) async {
    Database db = await this.database;

    var result = await db.insert(orderTable, order.toMap());

    return result;
  }

//delete order
  Future<int> deleteOrder(int id) async {
    Database db = await this.database;

    var result =
        await db.rawDelete("DELETE FROM $orderTable WHERE $orderId = $id");

    return result;
  }

//get number of orders
  Future<int> getCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery("SELECT COUNT (*) FROM $orderTable");
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}
