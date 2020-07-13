import 'package:flutter/material.dart';
import 'package:provider_api_flutter/models/cart_info.dart';
import 'package:provider_api_flutter/models/dept_info.dart';

class Cartinfoprovider extends ChangeNotifier {
  Map<String, Cartinfo> cartlist = {};

  Map<String, Cartinfo> get items {
    return {...cartlist};
  }

  int get itemcount {
    return cartlist.length;
  }

  addToCart(String deptName, String locName) {
    if (deptName != null) {
      cartlist.putIfAbsent(
          deptName, () => Cartinfo(deptName: deptName, locName: locName));
      notifyListeners();
    }
  }
}
