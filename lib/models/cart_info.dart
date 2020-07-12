import 'package:flutter/foundation.dart';

class Cartinfo {
  // String deptId;
  String deptName;

  Cartinfo(
      { //this.deptId,
      this.deptName});

  Cartinfo.fromJson(Map<String, dynamic> json) {
    // deptId = json['dept_id'];
    deptName = json['dept_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['dept_id'] = this.deptId;
    data['dept_name'] = this.deptName;
    return data;
  }
}
