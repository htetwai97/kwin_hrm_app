import 'package:hr_management_application/data/vo/pdf_document_vo.dart';
import 'package:hr_management_application/data/vo/related_department_vo.dart';
import 'package:hr_management_application/data/vo/related_position_vo.dart';

class UserDataVO {
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
  List<PDFDocumentVO>? profilePic;
  List<PDFDocumentVO>? educationCertificate;
  String? workExperience;
  List<PDFDocumentVO>? cV;
  List<PDFDocumentVO>? other;
  List<PDFDocumentVO>? recommendationLetter;
  String? firstInterviewDate;
  String? firstInterviewResult;
  String? secondInterviewDate;
  String? secondInterviewResult;
  String? startDate;
  String? fatherName;
  bool? isMarried;
  List<PDFDocumentVO>? marryCertificate;
  RelatedPositionVO? relatedPosition;
  RelatedDepartmentVO? relatedDepartment;
  bool? isDeleted;
  String? createdAt;
  int? iV;

  UserDataVO(
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
      this.profilePic,
      this.educationCertificate,
      this.workExperience,
      this.cV,
      this.other,
      this.recommendationLetter,
      this.firstInterviewDate,
      this.firstInterviewResult,
      this.secondInterviewDate,
      this.secondInterviewResult,
      this.startDate,
      this.fatherName,
      this.isMarried,
      this.marryCertificate,
      this.relatedPosition,
      this.relatedDepartment,
      this.isDeleted,
      this.createdAt,
      this.iV});

  UserDataVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    givenName = json['givenName'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    dOB = json['DOB'];
    emergencyContact = json['emergencyContact'];
    phone = json['phone'];
    nRC = json['NRC'];
    passportNo = json['passportNo'];
    educationBackground = json['educationBackground'];
    if (json['educationCertificate'] != null) {
      educationCertificate = <PDFDocumentVO>[];
      json['educationCertificate'].forEach((v) {
        educationCertificate!.add(new PDFDocumentVO.fromJson(v));
      });
    }
    workExperience = json['workExperience'];
    if (json['CV'] != null) {
      cV = <PDFDocumentVO>[];
      json['CV'].forEach((v) {
        cV!.add(new PDFDocumentVO.fromJson(v));
      });
    }
    if (json['other'] != null) {
      other = <PDFDocumentVO>[];
      json['other'].forEach((v) {
        other!.add(new PDFDocumentVO.fromJson(v));
      });
    }
    if (json['recommendationLetter'] != null) {
      recommendationLetter = <PDFDocumentVO>[];
      json['recommendationLetter'].forEach((v) {
        recommendationLetter!.add(new PDFDocumentVO.fromJson(v));
      });
    }
    if (json['profile'] != null) {
      profilePic = <PDFDocumentVO>[];
      json['profile'].forEach((v) {
        profilePic!.add(new PDFDocumentVO.fromJson(v));
      });
    }
    firstInterviewDate = json['firstInterviewDate'];
    firstInterviewResult = json['firstInterviewResult'];
    secondInterviewDate = json['secondInterviewDate'];
    secondInterviewResult = json['secondInterviewResult'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    relatedPosition = json['relatedPosition'] != null
        ? new RelatedPositionVO.fromJson(json['relatedPosition'])
        : null;
    relatedDepartment = json['relatedDepartment'] != null
        ? new RelatedDepartmentVO.fromJson(json['relatedDepartment'])
        : null;
    startDate = json['employedDate'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['givenName'] = this.givenName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['password'] = this.password;
    data['DOB'] = this.dOB;
    data['emergencyContact'] = this.emergencyContact;
    data['phone'] = this.phone;
    data['NRC'] = this.nRC;
    data['passportNo'] = this.passportNo;
    data['educationBackground'] = this.educationBackground;
    if (this.educationCertificate != null) {
      data['educationCertificate'] =
          this.educationCertificate!.map((v) => v.toJson()).toList();
    }
    data['workExperience'] = this.workExperience;
    if (this.cV != null) {
      data['CV'] = this.cV!.map((v) => v.toJson()).toList();
    }
    if (this.other != null) {
      data['other'] = this.other!.map((v) => v.toJson()).toList();
    }
    if (this.recommendationLetter != null) {
      data['recommendationLetter'] =
          this.recommendationLetter!.map((v) => v.toJson()).toList();
    }
    data['firstInterviewDate'] = this.firstInterviewDate;
    data['firstInterviewResult'] = this.firstInterviewResult;
    data['secondInterviewDate'] = this.secondInterviewDate;
    data['secondInterviewResult'] = this.secondInterviewResult;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    if (this.relatedPosition != null) {
      data['relatedPosition'] = this.relatedPosition!.toJson();
    }
    if (this.relatedDepartment != null) {
      data['relatedDepartment'] = this.relatedDepartment!.toJson();
    }
    if (this.profilePic != null) {
      data['profile'] = this.profilePic!.map((v) => v.toJson()).toList();
    }
    data['employedDate'] = this.startDate;
    data['gender'] = this.gender;
    return data;
  }
}
