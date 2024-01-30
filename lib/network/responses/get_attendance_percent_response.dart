import 'package:hr_management_application/data/vo/monthly_attendance_percent_vo.dart';

class GetAttendancePercentResponse {
  bool? success;
  List<MonthlyAttendancePercentVO>? data;

  GetAttendancePercentResponse({this.success, this.data});

  GetAttendancePercentResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <MonthlyAttendancePercentVO>[];
      json['data'].forEach((v) {
        data!.add(new MonthlyAttendancePercentVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
