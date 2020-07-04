import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_api_flutter/models/img_list.dart';

class Img_List_Provider extends ChangeNotifier {
  bool isLoading;

  Img_List imglist = Img_List();

  //Dept_Info list;
  List<Img_List> imglists;

  Future<List<Img_List>> hitApi() async {
    isLoading = true;
    var response =
        await http.get("http://192.168.10.7/db_samples/list_of_img.php");

    List parsed = jsonDecode(response.body);

    imglists = parsed.map((emp) => Img_List.fromJson(emp)).toList();

    isLoading = false;
    notifyListeners();
    return imglists;
  }
}
