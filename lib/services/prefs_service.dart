import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs{
  void storeId(String id)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('id',id);
  }
  Future<String> getId()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String uuid=prefs.getString('Id')!;
    return uuid;
  }
  removeId()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.remove('Id');

  }
}