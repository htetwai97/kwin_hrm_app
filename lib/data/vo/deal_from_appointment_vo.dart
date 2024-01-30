class DealFromAppointmentVO {
  String? sId;

  DealFromAppointmentVO({this.sId});

  DealFromAppointmentVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    return data;
  }
}