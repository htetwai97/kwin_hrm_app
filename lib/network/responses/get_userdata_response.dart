import 'package:hr_management_application/data/vo/user_data_vo.dart';

class GetEmployeeDataResponse {
  bool? success;
  UserDataVO? user;

  GetEmployeeDataResponse({this.success, this.user});

  GetEmployeeDataResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['data'] != null ? new UserDataVO.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['data'] = this.user!.toJson();
    }
    return data;
  }
}




