import 'package:flutter/foundation.dart';

class Dept_Info {
  String deptId;
  String deptName;

  Dept_Info({this.deptId, this.deptName});

  Dept_Info.fromJson(Map<String, dynamic> json) {
    deptId = json['dept_id'];
    deptName = json['dept_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dept_id'] = this.deptId;
    data['dept_name'] = this.deptName;
    return data;
  }
}
