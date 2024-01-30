class RealTimePayRollVO {
  int? attendedSalary;
  int? dismissedSalary;
  int? entitledSalary;
  int? totalAttendance;
  int? paid;
  int? unpaid;

  RealTimePayRollVO(
      {this.attendedSalary,
      this.dismissedSalary,
      this.entitledSalary,
      this.totalAttendance,
      this.paid,
      this.unpaid});

  RealTimePayRollVO.fromJson(Map<String, dynamic> json) {
    attendedSalary = json['attendedSalary'];
    dismissedSalary = json['dismissedSalary'];
    entitledSalary = json['entitledSalary'];
    totalAttendance = json['totalAttendance'];
    paid = json['paid'];
    unpaid = json['unpaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendedSalary'] = this.attendedSalary;
    data['dismissedSalary'] = this.dismissedSalary;
    data['entitledSalary'] = this.entitledSalary;
    data['totalAttendance'] = this.totalAttendance;
    data['paid'] = this.paid;
    data['unpaid'] = this.unpaid;
    return data;
  }
}
