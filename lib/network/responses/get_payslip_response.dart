import 'package:hr_management_application/data/vo/payslip_data_vo.dart';

class GetPaySlipResponse {
  bool? success;
  List<PaySlipDataVO>? data;

  GetPaySlipResponse({this.success, this.data});

  GetPaySlipResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <PaySlipDataVO>[];
      json['data'].forEach((v) {
        data!.add(new PaySlipDataVO.fromJson(v));
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
