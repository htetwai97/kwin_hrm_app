// class RelatedDepartmentVO {
//   String? sId;
//   bool? isDeleted;
//   String? name;
//   String? description;
//   String? level;
//   String? function;
//   String? activities;
//   String? reportingTo;
//   String? departmentManager;
//   String? assistantManager;
//   String? relatedSalaryAccount;
//   String? relatedExpenseAccount;
//   String? createdAt;
//   int? iV;
//
//   RelatedDepartmentVO(
//       {this.sId,
//         this.isDeleted,
//         this.name,
//         this.description,
//         this.level,
//         this.function,
//         this.activities,
//         this.reportingTo,
//         this.departmentManager,
//         this.assistantManager,
//         this.relatedSalaryAccount,
//         this.relatedExpenseAccount,
//         this.createdAt,
//         this.iV});
//
//   RelatedDepartmentVO.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     isDeleted = json['isDeleted'];
//     name = json['name'];
//     description = json['description'];
//     level = json['level'];
//     function = json['function'];
//     activities = json['activities'];
//     reportingTo = json['reportingTo'];
//     departmentManager = json['departmentManager'];
//     assistantManager = json['assistantManager'];
//     relatedSalaryAccount = json['relatedSalaryAccount'];
//     relatedExpenseAccount = json['relatedExpenseAccount'];
//     createdAt = json['createdAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['isDeleted'] = this.isDeleted;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['level'] = this.level;
//     data['function'] = this.function;
//     data['activities'] = this.activities;
//     data['reportingTo'] = this.reportingTo;
//     data['departmentManager'] = this.departmentManager;
//     data['assistantManager'] = this.assistantManager;
//     data['relatedSalaryAccount'] = this.relatedSalaryAccount;
//     data['relatedExpenseAccount'] = this.relatedExpenseAccount;
//     data['createdAt'] = this.createdAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

import 'package:hr_management_application/data/vo/direct_manager_vo.dart';

class RelatedDepartmentVO {
  String? sId;
  bool? isDeleted;
  String? name;
  String? description;
  String? level;
  String? function;
  String? activities;
  String? reportingTo;
  DirectManagerVO? directManager;
  String? assistantManager;
  String? createdAt;
  int? iV;
  bool? topLevel;

  RelatedDepartmentVO(
      {this.sId,
      this.isDeleted,
      this.name,
      this.description,
      this.level,
      this.function,
      this.activities,
      this.reportingTo,
      this.directManager,
      this.assistantManager,
      this.createdAt,
      this.iV,
      this.topLevel});

  RelatedDepartmentVO.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    description = json['description'];
    level = json['level'];
    function = json['function'];
    activities = json['activities'];
    reportingTo = json['reportingTo'];
    directManager = json['directManager'] != null
        ? new DirectManagerVO.fromJson(json['directManager'])
        : null;
    assistantManager = json['assistantManager'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    topLevel = json['topLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['description'] = this.description;
    data['level'] = this.level;
    data['function'] = this.function;
    data['activities'] = this.activities;
    data['reportingTo'] = this.reportingTo;
    if (this.directManager != null) {
      data['directManager'] = this.directManager!.toJson();
    }
    data['assistantManager'] = this.assistantManager;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['topLevel'] = this.topLevel;
    return data;
  }
}




