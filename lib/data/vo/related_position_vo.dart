class RelatedPositionVO {
  String? sId;
  bool? isDeleted;
  String? name;
  String? description;
  String? relatedDepartment;
  int? basicSalary;
  bool? isIncentive;
  String? incentiveCondition;
  int? incentive;
  bool? isBonus;
  String? bonusCondition;
  int? bonus;
  bool? isMealAllowance;
  int? mealAllowance;
  bool? isTravelAllowance;
  int? travelAllowance;

  ///String? workingDay;
  String? workingFrom;
  String? workingUntil;
  int? casualLeaves;
  int? medicalLeaves;
  int? vacationLeaves;
  int? maternityLeaveMale;
  int? maternityLeaveFemale;
  String? createdAt;
  int? iV;

  RelatedPositionVO(
      {this.sId,
      this.isDeleted,
      this.name,
      this.description,
      this.relatedDepartment,
      this.basicSalary,
      this.isIncentive,
      this.incentiveCondition,
      this.incentive,
      this.isBonus,
      this.bonusCondition,
      this.bonus,
      this.isMealAllowance,
      this.mealAllowance,
      this.isTravelAllowance,
      this.travelAllowance,

      ///this.workingDay,
      this.workingFrom,
      this.workingUntil,
      this.casualLeaves,
      this.medicalLeaves,
      this.vacationLeaves,
      this.maternityLeaveMale,
      this.maternityLeaveFemale,
      this.createdAt,
      this.iV});

  RelatedPositionVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    description = json['description'];
    relatedDepartment = json['relatedDepartment'];
    basicSalary = json['basicSalary'];
    isIncentive = json['isIncentive'];
    incentiveCondition = json['incentiveCondition'];
    incentive = json['incentive'];
    isBonus = json['isBonus'];
    bonusCondition = json['bonusCondition'];
    bonus = json['bonus'];
    isMealAllowance = json['isMealAllowance'];
    mealAllowance = json['mealAllowance'];
    isTravelAllowance = json['isTravelAllowance'];
    travelAllowance = json['travelAllowance'];

    ///workingDay = json['workingDay'];
    workingFrom = json['workingFrom'];
    workingUntil = json['workingUntil'];
    casualLeaves = json['casualLeaves'];
    medicalLeaves = json['medicalLeaves'];
    vacationLeaves = json['vacationLeaves'];
    maternityLeaveMale = json['maternityLeaveMale'];
    maternityLeaveFemale = json['maternityLeaveFemale'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['description'] = this.description;
    data['relatedDepartment'] = this.relatedDepartment;
    data['basicSalary'] = this.basicSalary;
    data['isIncentive'] = this.isIncentive;
    data['incentiveCondition'] = this.incentiveCondition;
    data['incentive'] = this.incentive;
    data['isBonus'] = this.isBonus;
    data['bonusCondition'] = this.bonusCondition;
    data['bonus'] = this.bonus;
    data['isMealAllowance'] = this.isMealAllowance;
    data['mealAllowance'] = this.mealAllowance;
    data['isTravelAllowance'] = this.isTravelAllowance;
    data['travelAllowance'] = this.travelAllowance;

    ///data['workingDay'] = this.workingDay;
    data['workingFrom'] = this.workingFrom;
    data['workingUntil'] = this.workingUntil;
    data['casualLeaves'] = this.casualLeaves;
    data['medicalLeaves'] = this.medicalLeaves;
    data['vacationLeaves'] = this.vacationLeaves;
    data['maternityLeaveMale'] = this.maternityLeaveMale;
    data['maternityLeaveFemale'] = this.maternityLeaveFemale;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
