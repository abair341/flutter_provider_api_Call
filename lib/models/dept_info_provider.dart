import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_api_flutter/models/dept_info.dart';
import 'package:http/http.dart' as http;

class Dept_Info_Provider extends ChangeNotifier {
  bool isLoading;

  Dept_Info dept_info = Dept_Info();

  //Dept_Info list;
  List<Dept_Info> list;

  Future<List<Dept_Info>> hitApi() async {
    isLoading = true;
    var response =
        await http.get("http://192.168.10.7/db_samples/db_dept_info_all.php");

    List parsed = jsonDecode(response.body);

    list = parsed.map((emp) => Dept_Info.fromJson(emp)).toList();

    isLoading = false;
    notifyListeners();
    return list;
  }
}
