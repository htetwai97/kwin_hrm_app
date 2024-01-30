class DirectManagerVO {
  String? sId;
  String? givenName;
  String? email;
  String? address;
  String? password;
  String? dOB;
  String? gender;
  String? emergencyContact;
  String? phone;
  String? nRC;
  String? passportNo;
  String? educationBackground;
  List<String>? profile;
  List<String>? educationCertificate;
  String? workExperience;
  List<String>? cV;
  List<String>? other;
  List<String>? recommendationLetter;
  String? firstInterviewDate;
  String? firstInterviewResult;
  String? secondInterviewDate;
  String? secondInterviewResult;
  String? employedDate;
  String? fatherName;
  bool? isMarried;
  List<String>? married;
  String? relatedDepartment;
  String? relatedPosition;
  bool? isDeleted;
  String? createdAt;
  int? iV;

  DirectManagerVO(
      {this.sId,
        this.givenName,
        this.email,
        this.address,
        this.password,
        this.dOB,
        this.gender,
        this.emergencyContact,
        this.phone,
        this.nRC,
        this.passportNo,
        this.educationBackground,
        this.profile,
        this.educationCertificate,
        this.workExperience,
        this.cV,
        this.other,
        this.recommendationLetter,
        this.firstInterviewDate,
        this.firstInterviewResult,
        this.secondInterviewDate,
        this.secondInterviewResult,
        this.employedDate,
        this.fatherName,
        this.isMarried,
        this.married,
        this.relatedDepartment,
        this.relatedPosition,
        this.isDeleted,
        this.createdAt,
        this.iV});

  DirectManagerVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    givenName = json['givenName'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    dOB = json['DOB'];
    gender = json['gender'];
    emergencyContact = json['emergencyContact'];
    phone = json['phone'];
    nRC = json['NRC'];
    passportNo = json['passportNo'];
    educationBackground = json['educationBackground'];
    profile = json['profile'].cast<String>();
    educationCertificate = json['educationCertificate'].cast<String>();
    workExperience = json['workExperience'];
    cV = json['CV'].cast<String>();
    other = json['other'].cast<String>();
    recommendationLetter = json['recommendationLetter'].cast<String>();
    firstInterviewDate = json['firstInterviewDate'];
    firstInterviewResult = json['firstInterviewResult'];
    secondInterviewDate = json['secondInterviewDate'];
    secondInterviewResult = json['secondInterviewResult'];
    employedDate = json['employedDate'];
    fatherName = json['fatherName'];
    isMarried = json['isMarried'];
    married = json['married'].cast<String>();
    relatedDepartment = json['relatedDepartment'];
    relatedPosition = json['relatedPosition'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['givenName'] = this.givenName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['password'] = this.password;
    data['DOB'] = this.dOB;
    data['gender'] = this.gender;
    data['emergencyContact'] = this.emergencyContact;
    data['phone'] = this.phone;
    data['NRC'] = this.nRC;
    data['passportNo'] = this.passportNo;
    data['educationBackground'] = this.educationBackground;
    data['profile'] = this.profile;
    data['educationCertificate'] = this.educationCertificate;
    data['workExperience'] = this.workExperience;
    data['CV'] = this.cV;
    data['other'] = this.other;
    data['recommendationLetter'] = this.recommendationLetter;
    data['firstInterviewDate'] = this.firstInterviewDate;
    data['firstInterviewResult'] = this.firstInterviewResult;
    data['secondInterviewDate'] = this.secondInterviewDate;
    data['secondInterviewResult'] = this.secondInterviewResult;
    data['employedDate'] = this.employedDate;
    data['fatherName'] = this.fatherName;
    data['isMarried'] = this.isMarried;
    data['married'] = this.married;
    data['relatedDepartment'] = this.relatedDepartment;
    data['relatedPosition'] = this.relatedPosition;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}