class EmployeeLeavesVO {
  String? sId;
  int? casualLeaves;
  int? maternityLeaveFemale;
  int? maternityLeaveMale;
  int? medicalLeaves;
  int? vacationLeaves;

  EmployeeLeavesVO(
      {this.sId,
      this.casualLeaves,
      this.maternityLeaveFemale,
      this.maternityLeaveMale,
      this.medicalLeaves,
      this.vacationLeaves});

  EmployeeLeavesVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    casualLeaves = json['casualLeaves'];
    maternityLeaveFemale = json['maternityLeaveFemale'];
    maternityLeaveMale = json['maternityLeaveMale'];
    medicalLeaves = json['medicalLeaves'];
    vacationLeaves = json['vacationLeaves'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['casualLeaves'] = this.casualLeaves;
    data['maternityLeaveFemale'] = this.maternityLeaveFemale;
    data['maternityLeaveMale'] = this.maternityLeaveMale;
    data['medicalLeaves'] = this.medicalLeaves;
    data['vacationLeaves'] = this.vacationLeaves;
    return data;
  }
}
