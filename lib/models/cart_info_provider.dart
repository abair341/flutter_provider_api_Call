import 'package:flutter/material.dart';
import 'package:provider_api_flutter/models/cart_info.dart';

class Cartinfoprovider extends ChangeNotifier {
  Map<String, Cartinfo> cartlist = {};

  Map<String, Cartinfo> get items {
    return {...items};
  }

  int get itemcount {
    return items.length;
  }

  addToCart(String d_name) {
    if (d_name != null) {
      cartlist.putIfAbsent(
        d_name,
        () => Cartinfo(deptName: d_name),
      );
      notifyListeners();
    }
  }
}
