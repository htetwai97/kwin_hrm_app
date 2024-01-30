import 'package:hr_management_application/data/vo/customer_from_appointment_vo.dart';
import 'package:hr_management_application/data/vo/deal_from_appointment_vo.dart';
import 'package:hr_management_application/data/vo/employee_from_appointment_vo.dart';

class DataFromAppointmentVO {
  int? index;
  String? sId;
  String? date;
  String? remark;
  String? type;
  EmployeeFromAppointmentVO? employee;
  CustomerFromAppointmentVO? customer;
  DealFromAppointmentVO? deal;
  String? status;
  bool? checkIn;
  bool? checkOut;
  bool? reported;
  double? latitude;
  double? longitude;
  String? address;
  String? attendanceId;

  DataFromAppointmentVO({
    this.index,
    this.sId,
    this.date,
    this.remark,
    this.type,
    this.employee,
    this.customer,
    this.deal,
    this.status,
    this.checkIn,
    this.checkOut,
    this.reported,
    this.latitude,
    this.longitude,
    this.address,
    this.attendanceId,
  });

  DataFromAppointmentVO.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    sId = json['_id'];
    date = json['date'];
    remark = json['remark'];
    type = json['type'];
    employee = json['employee'] != null
        ? new EmployeeFromAppointmentVO.fromJson(json['employee'])
        : null;
    customer = json['customer'] != null
        ? new CustomerFromAppointmentVO.fromJson(json['customer'])
        : null;
    deal = json['deal'] != null
        ? new DealFromAppointmentVO.fromJson(json['deal'])
        : null;
    status = json['status'];
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
    reported = json['reported'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    attendanceId = json['attendanceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['_id'] = this.sId;
    data['date'] = this.date;
    data['remark'] = this.remark;
    data['type'] = this.type;
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.deal != null) {
      data['deal'] = this.deal!.toJson();
    }
    data['status'] = this.status;
    data['checkIn'] = this.checkIn;
    data['checkOut'] = this.checkOut;
    data['reported'] = this.reported;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['attendanceId'] = this.attendanceId;
    return data;
  }
}
