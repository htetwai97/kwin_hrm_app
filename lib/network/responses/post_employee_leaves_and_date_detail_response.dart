import 'package:hr_management_application/data/vo/date_detail_vo.dart';
import 'package:hr_management_application/data/vo/employee_leaves_vo.dart';

class PostEmployeeLeavesAndDateDetailResponse {
  bool? success;
  EmployeeLeavesVO? employee;
  List<DateDetailVO>? data;

  PostEmployeeLeavesAndDateDetailResponse(
      {this.success, this.employee, this.data});

  PostEmployeeLeavesAndDateDetailResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    employee = json['employee'] != null
        ? new EmployeeLeavesVO.fromJson(json['employee'])
        : null;
    if (json['data'] != null) {
      data = <DateDetailVO>[];
      json['data'].forEach((v) {
        data!.add(new DateDetailVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
