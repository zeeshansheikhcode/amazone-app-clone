import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OrderViewModel extends ChangeNotifier
{
  String username = "John";
  getUserName() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('UserName')!;
    notifyListeners();
  }
}