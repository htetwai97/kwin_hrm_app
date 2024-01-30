class PaySlipDataVO {
  String? sId;
  bool? isDeleted;
  String? relatedDepartment;
  dynamic maPerDay;
  dynamic maTotalDays;
  dynamic maTotalAmount;
  dynamic travelPerDay;
  dynamic travelTotalDays;
  dynamic travelTotalAmount;
  dynamic otPerDay;
  dynamic otTotalDays;
  dynamic otTotalAmount;
  dynamic incentiveAmount;
  dynamic bonusAmount;
  dynamic incomeTaxAmount;
  dynamic subTotal;
  dynamic netSalary;
  dynamic totalAttendance;
  dynamic entitledSalary;
  dynamic paidDays;
  dynamic unpaidDays;
  dynamic attendedSalary;
  dynamic dismissedSalary;
  String? month;
  bool? isExtra;
  String? createdAt;
  int? iV;
  String? bonusReason;
  String? incentiveReason;
  String? incomeTaxPercent;

  PaySlipDataVO(
      {this.sId,
      this.isDeleted,
      this.relatedDepartment,
      this.maPerDay,
      this.maTotalDays,
      this.maTotalAmount,
      this.travelPerDay,
      this.travelTotalDays,
      this.travelTotalAmount,
      this.otPerDay,
      this.otTotalDays,
      this.otTotalAmount,
      this.incentiveAmount,
      this.bonusAmount,
      this.incomeTaxAmount,
      this.subTotal,
      this.netSalary,
      this.totalAttendance,
      this.entitledSalary,
      this.paidDays,
      this.unpaidDays,
      this.attendedSalary,
      this.dismissedSalary,
      this.month,
      this.isExtra,
      this.createdAt,
      this.iV,
      this.bonusReason,
      this.incentiveReason,
      this.incomeTaxPercent});

  PaySlipDataVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    relatedDepartment = json['relatedDepartment'];
    maPerDay = json['maPerDay'];
    maTotalDays = json['maTotalDays'];
    maTotalAmount = json['maTotalAmount'];
    travelPerDay = json['travelPerDay'];
    travelTotalDays = json['travelTotalDays'];
    travelTotalAmount = json['travelTotalAmount'];
    otPerDay = json['otPerDay'];
    otTotalDays = json['otTotalDays'];
    otTotalAmount = json['otTotalAmount'];
    incentiveAmount = json['incentiveAmount'];
    bonusAmount = json['bonusAmount'];
    incomeTaxAmount = json['incomeTaxAmount'];
    subTotal = json['subTotal'];
    netSalary = json['netSalary'];
    totalAttendance = json['totalAttendance'];
    entitledSalary = json['entitledSalary'];
    paidDays = json['paidDays'];
    unpaidDays = json['unpaidDays'];
    attendedSalary = json['attendedSalary'];
    dismissedSalary = json['dismissedSalary'];
    month = json['month'];
    isExtra = json['isExtra'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    bonusReason = json['bonusReason'];
    incentiveReason = json['incentiveReason'];
    incomeTaxPercent = json['incomeTaxPercent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['relatedDepartment'] = this.relatedDepartment;
    data['maPerDay'] = this.maPerDay;
    data['maTotalDays'] = this.maTotalDays;
    data['maTotalAmount'] = this.maTotalAmount;
    data['travelPerDay'] = this.travelPerDay;
    data['travelTotalDays'] = this.travelTotalDays;
    data['travelTotalAmount'] = this.travelTotalAmount;
    data['otPerDay'] = this.otPerDay;
    data['otTotalDays'] = this.otTotalDays;
    data['otTotalAmount'] = this.otTotalAmount;
    data['incentiveAmount'] = this.incentiveAmount;
    data['bonusAmount'] = this.bonusAmount;
    data['incomeTaxAmount'] = this.incomeTaxAmount;
    data['subTotal'] = this.subTotal;
    data['netSalary'] = this.netSalary;
    data['totalAttendance'] = this.totalAttendance;
    data['entitledSalary'] = this.entitledSalary;
    data['paidDays'] = this.paidDays;
    data['unpaidDays'] = this.unpaidDays;
    data['attendedSalary'] = this.attendedSalary;
    data['dismissedSalary'] = this.dismissedSalary;
    data['month'] = this.month;
    data['isExtra'] = this.isExtra;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['bonusReason'] = this.bonusReason;
    data['incentiveReason'] = this.incentiveReason;
    data['incomeTaxPercent'] = this.incomeTaxPercent;
    return data;
  }
}
