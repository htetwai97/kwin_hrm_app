import 'package:hr_management_application/data/vo/realtime_payroll_vo.dart';

class PostRealTimePayRollResponse {
  bool? success;
  bool? error;
  String? message;
  RealTimePayRollVO? data;

  PostRealTimePayRollResponse({
    this.success,
    this.data,
    this.error,
    this.message,
  });

  PostRealTimePayRollResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new RealTimePayRollVO.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
