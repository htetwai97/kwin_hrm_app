import 'package:hr_management_application/data/vo/location_data_vo.dart';

class GetLocationResponse {
  bool? success;
  List<LocationDataVO>? data;

  GetLocationResponse({this.success, this.data});

  GetLocationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <LocationDataVO>[];
      json['data'].forEach((v) {
        data!.add(new LocationDataVO.fromJson(v));
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
