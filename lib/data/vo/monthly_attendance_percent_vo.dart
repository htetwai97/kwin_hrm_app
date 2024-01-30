class MonthlyAttendancePercentVO {
  String? month;
  int? attended;
  int? missed;
  int? attendedDays;
  int? missedDays;

  MonthlyAttendancePercentVO(
      {this.month,
      this.attended,
      this.missed,
      this.attendedDays,
      this.missedDays});

  MonthlyAttendancePercentVO.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    attended = json['attended'];
    missed = json['missed'];
    attendedDays = json['attendedDays'];
    missedDays = json['missedDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['attended'] = this.attended;
    data['missed'] = this.missed;
    data['attendedDays'] = this.attendedDays;
    data['missedDays'] = this.missedDays;
    return data;
  }
}
