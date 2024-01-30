class DateDetailVO {
  String? sId;
  bool? isDeleted;
  String? date;
  String? relatedUser;
  String? type;
  String? source;
  String? clockIn;
  String? clockOut;
  String? relatedDepartment;
  String? createdAt;
  int? iV;
  String? attendType;
  String? remark;

  DateDetailVO({
    this.sId,
    this.isDeleted,
    this.date,
    this.relatedUser,
    this.type,
    this.source,
    this.clockIn,
    this.clockOut,
    this.relatedDepartment,
    this.createdAt,
    this.iV,
    this.attendType,
    this.remark,
  });

  DateDetailVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    date = json['date'];
    relatedUser = json['relatedUser'];
    type = json['type'];
    source = json['source'];
    clockIn = json['clockIn'];
    clockOut = json['clockOut'];
    relatedDepartment = json['relatedDepartment'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    attendType = json['attendType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['date'] = this.date;
    data['relatedUser'] = this.relatedUser;
    data['type'] = this.type;
    data['source'] = this.source;
    data['clockIn'] = this.clockIn;
    data['clockOut'] = this.clockOut;
    data['relatedDepartment'] = this.relatedDepartment;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['attendType'] = this.attendType;
    return data;
  }
}
