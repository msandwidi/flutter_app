import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import '../utils/constant.dart';

class ApiService {
  static Future<http.Response> handleSignin() async {
    final response = await http.post(Constant.LOGIN_URL);
    if (response.statusCode == 200) {
      Map<String, dynamic> user = json.decode(response.body)["user"];
      debugPrint(user.toString());
    } else
      return null;
  }
}
