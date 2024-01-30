class HrmCheckInDataVO {
  bool? isDeleted;
  String? date;
  String? relatedUser;
  bool? isPaid;
  String? type;
  String? source;
  String? clockIn;
  String? relatedDepartment;
  String? sId;
  String? createdAt;
  int? iV;

  HrmCheckInDataVO(
      {this.isDeleted,
      this.date,
      this.relatedUser,
      this.isPaid,
      this.type,
      this.source,
      this.clockIn,
      this.relatedDepartment,
      this.sId,
      this.createdAt,
      this.iV});

  HrmCheckInDataVO.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    date = json['date'];
    relatedUser = json['relatedUser'];
    isPaid = json['isPaid'];
    type = json['type'];
    source = json['source'];
    clockIn = json['clockIn'];
    relatedDepartment = json['relatedDepartment'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['date'] = this.date;
    data['relatedUser'] = this.relatedUser;
    data['isPaid'] = this.isPaid;
    data['type'] = this.type;
    data['source'] = this.source;
    data['clockIn'] = this.clockIn;
    data['relatedDepartment'] = this.relatedDepartment;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
