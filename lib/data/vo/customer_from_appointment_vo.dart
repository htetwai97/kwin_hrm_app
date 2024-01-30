class CustomerFromAppointmentVO {
  String? sId;
  String? name;
  String? code;
  String? email;
  String? phone;
  String? businessType;
  String? businessName;
  String? status;
  List<String>? customerAccounts;
  int? appointmentCount;

  CustomerFromAppointmentVO(
      {this.sId,
        this.name,
        this.code,
        this.email,
        this.phone,
        this.businessType,
        this.businessName,
        this.status,
        this.customerAccounts,
        this.appointmentCount});

  CustomerFromAppointmentVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    code = json['code'];
    email = json['email'];
    phone = json['phone'];
    businessType = json['businessType'];
    businessName = json['businessName'];
    status = json['status'];
    customerAccounts = json['customerAccounts'].cast<String>();
    appointmentCount = json['appointmentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['businessType'] = this.businessType;
    data['businessName'] = this.businessName;
    data['status'] = this.status;
    data['customerAccounts'] = this.customerAccounts;
    data['appointmentCount'] = this.appointmentCount;
    return data;
  }
}