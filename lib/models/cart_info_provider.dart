import 'package:flutter/material.dart';
import 'package:provider_api_flutter/models/cart_info.dart';
import 'package:provider_api_flutter/models/dept_info.dart';

class Cartinfoprovider extends ChangeNotifier {
  Map<String, Cartinfo> cartlist = {};

  List<Dept_Info> clist = [];

  addCart(Dept_Info deptName) {
    print(deptName);
    clist.add(deptName);
  }

  Map<String, Cartinfo> get items {
    return {...items};
  }

  int get itemcount {
    return items.length;
  }

  addToCart(String deptName) {
    // print(deptName);
    if (deptName != null) {
      cartlist.putIfAbsent(
        deptName,
        () => Cartinfo(deptName: deptName),
      );
      notifyListeners();
    }
  }
}
