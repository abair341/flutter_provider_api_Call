import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_api_flutter/models/dept_info.dart';
import 'package:http/http.dart' as http;

class Dept_Info_Provider extends ChangeNotifier {
  bool isLoading = true;

  Dept_Info dept_info = Dept_Info();

  Dept_Info list;

  setData(Dept_Info data) {
    dept_info = data;
    list = data;
    print(data);
    isLoading = false;
    notifyListeners();
  }

  Dept_Info getData() {
    return dept_info;
  }

  Future<Dept_Info> hitApi() async {
    var response =
        await http.get("http://localhost/db_samples/db_dept_info_all.php");
    final Map parsed = json.decode(response.body);
    Dept_Info dept_info_new = Dept_Info.fromJson(parsed);

    return dept_info_new;
  }
}
