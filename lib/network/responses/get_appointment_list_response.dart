import 'package:hr_management_application/data/vo/data_from_appointment_vo.dart';

class GetAppointmentResponse {
  List<DataFromAppointmentVO>? data;
  GetAppointmentResponse({this.data});

  GetAppointmentResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataFromAppointmentVO>[];
      json['data'].forEach((v) {
        data!.add(new DataFromAppointmentVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
