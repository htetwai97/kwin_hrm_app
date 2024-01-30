import 'package:hr_management_application/data/vo/hrm_check_in_data_vo.dart';

class PostHRMCheckInResponse {
  bool? success;
  bool? error;
  String? message;
  HrmCheckInDataVO? data;

  PostHRMCheckInResponse({this.error, this.success, this.message, this.data});

  PostHRMCheckInResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new HrmCheckInDataVO.fromJson(json['data'])
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
