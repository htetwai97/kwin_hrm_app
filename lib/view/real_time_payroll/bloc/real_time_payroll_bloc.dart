// import 'package:flutter/foundation.dart';
// import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
// import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
// import 'package:hr_management_application/data/vo/date_detail_vo.dart';
// import 'package:hr_management_application/data/vo/employee_leaves_vo.dart';
// import 'package:hr_management_application/data/vo/realtime_payroll_vo.dart';
// import 'package:hr_management_application/data/vo/user_data_vo.dart';
// import 'package:hr_management_application/persistence/share_preference/share_preference_key_constants.dart';
// import 'package:intl/intl.dart';
//
// class RealTimePayRollBloc extends ChangeNotifier {
//   /// Bloc state
//   bool isDisposed = false;
//
//   /// Dependencies
//   final HRMRepoModel _hrmRepoModel = HRMRepoModelImpl();
//
//   /// Loading State
//   bool isLoading = false;
//
//   /// Screen states
//   List<DateDetailVO>? apiDateList = [];
//   List<DateDetailVO> allDaysForMonth = [];
//   EmployeeLeavesVO? employeeLeaves;
//   String? gender;
//   int attend = 0;
//   int dismiss = 0;
//   int holiday = 0;
//   int leave = 0;
//   UserDataVO? userDataVO;
//   RealTimePayRollVO? realTimePayRollVO;
//
//   RealTimePayRollBloc() {
//     _showLoading();
//     String currentMonthName = DateFormat('MMMM').format(DateTime.now());
//     String month = "";
//     switch (currentMonthName) {
//       case "January":
//         month = "Jan";
//         break;
//       case "February":
//         month = "Feb";
//         break;
//       case "March":
//         month = "March";
//         break;
//       case "April":
//         month = "April";
//         break;
//       case "May":
//         month = "May";
//         break;
//       case "June":
//         month = "June";
//         break;
//       case "July":
//         month = "July";
//         break;
//       case "August":
//         month = "Aug";
//         break;
//       case "September":
//         month = "Sep";
//         break;
//       case "October":
//         month = "Oct";
//         break;
//       case "November":
//         month = "Nov";
//         break;
//       case "December":
//         month = "Dec";
//         break;
//       default:
//         month = "Jan";
//     }
//     _hrmRepoModel.getString(EMPLOYEE_ID).then((id) {
//       _hrmRepoModel.getString(GENDER).then((gender) {
//         this.gender = gender;
//         _notifySafely();
//         _hrmRepoModel
//             .postEmployeeLeavesAndDateDetails(id, month)
//             .then((response) {
//           apiDateList = response.data?.map((e) {
//             String dateString =
//                 e.date?.substring(0, 19).replaceAll("T", " ") ?? "";
//             var dateTime =
//                 DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString, true);
//             var dateLocal = dateTime.toLocal();
//             e.date = dateLocal.toString().substring(0, 10);
//             return e;
//           }).toList();
//           if (apiDateList != null) {
//             var dateUtc = DateTime.now().toUtc();
//             var dateLocal = dateUtc.toLocal();
//             allDaysForMonth = List.generate(
//                 _getDaysInMonth(dateLocal.year, dateLocal.month), (index) {
//               return DateDetailVO(
//                 date: DateTime(dateLocal.year, 9, index + 1)
//                     .toString()
//                     .substring(0, 10),
//                 clockIn: "",
//                 clockOut: "",
//               );
//             });
//             Map<String, String> updatedTimeMap = Map.fromIterable(
//                 apiDateList as Iterable<DateDetailVO>,
//                 key: (apiDate) => apiDate.date,
//                 value: (apiDate) =>
//                     "${apiDate.clockIn ?? ""}/${apiDate.clockOut ?? ""}/${apiDate.type ?? ""}/${apiDate.source ?? ""}");
//
//             for (int i = 0; i < allDaysForMonth.length; i++) {
//               String dateAsString = allDaysForMonth[i].date ?? "";
//               if (updatedTimeMap.containsKey(dateAsString)) {
//                 List<String> list = updatedTimeMap[dateAsString]!.split("/");
//                 allDaysForMonth[i].clockIn = list[0];
//                 allDaysForMonth[i].clockOut = list[1];
//                 allDaysForMonth[i].type = list[2];
//                 allDaysForMonth[i].source = list[3];
//                 _notifySafely();
//               }
//             }
//             attend = apiDateList
//                     ?.where((element) =>
//                         element.type == "Attend" &&
//                         element.attendType == "Week Day")
//                     .toList()
//                     .length ??
//                 0;
//
//             dismiss = apiDateList
//                     ?.where((element) =>
//                         element.type == "Dismiss" && element.source != "Leave")
//                     .toList()
//                     .length ??
//                 0;
//             leave = apiDateList
//                     ?.where((element) =>
//                         element.type == "Dismiss" && element.source == "Leave")
//                     .toList()
//                     .length ??
//                 0;
//             holiday = apiDateList
//                     ?.where((element) =>
//                         element.attendType == "Day Off" ||
//                         element.attendType == "Holiday")
//                     .toList()
//                     .length ??
//                 0;
//             _notifySafely();
//           }
//           _hrmRepoModel.getEmployeeData().then((response) {
//             userDataVO = response.user;
//             _notifySafely();
//             _hrmRepoModel
//                 .postRealTimePayRoll(
//                     userDataVO?.sId ?? "",
//                     userDataVO?.relatedDepartment?.sId ?? "",
//                     month,
//                     userDataVO?.relatedPosition?.basicSalary ?? 0)
//                 .then((realTimeResponse) {
//               realTimePayRollVO = realTimeResponse.data;
//               _notifySafely();
//               _hideLoading();
//             });
//           });
//         });
//       });
//     });
//   }
//
//   int _getDaysInMonth(int year, int month) {
//     return DateTime(year, month + 1, 0).day;
//   }
//
//   /// loading situations
//   void _showLoading() {
//     isLoading = true;
//     _notifySafely();
//   }
//
//   void _hideLoading() {
//     isLoading = false;
//     _notifySafely();
//   }
//
//   void _notifySafely() {
//     if (!isDisposed) {
//       notifyListeners();
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     isDisposed = true;
//   }
// }

// import 'package:flutter/foundation.dart';
// import 'package:hrm_medical_world_app_two/data/repo_model/hrm_repo_model.dart';
// import 'package:hrm_medical_world_app_two/data/repo_model/hrm_repo_model_impl.dart';
// import 'package:hrm_medical_world_app_two/data/vo/date_detail_vo.dart';
// import 'package:hrm_medical_world_app_two/data/vo/employee_leaves_vo.dart';
// import 'package:hrm_medical_world_app_two/data/vo/realtime_payroll_vo.dart';
// import 'package:hrm_medical_world_app_two/data/vo/user_data_vo.dart';
// import 'package:hrm_medical_world_app_two/persistence/share_preference/share_preference_key_constants.dart';
// import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/data/vo/date_detail_vo.dart';
import 'package:hr_management_application/data/vo/employee_leaves_vo.dart';
import 'package:hr_management_application/data/vo/realtime_payroll_vo.dart';
import 'package:hr_management_application/data/vo/user_data_vo.dart';
import 'package:hr_management_application/persistence/share_preference/share_preference_key_constants.dart';
import 'package:intl/intl.dart';

class RealTimePayRollBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HRMRepoModel _hrmRepoModel = HRMRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<DateDetailVO>? apiDateList = [];
  List<DateDetailVO> allDaysForMonth = [];
  EmployeeLeavesVO? employeeLeaves;
  String? gender;
  int attend = 0;
  int dismiss = 0;
  int holiday = 0;
  int leave = 0;
  UserDataVO? userDataVO;
  RealTimePayRollVO? realTimePayRollVO;

  RealTimePayRollBloc() {
    _showLoading();
    String currentMonthName = DateFormat('MMMM').format(DateTime.now());
    String month = "";
    switch (currentMonthName) {
      case "January":
        month = "Jan";
        break;
      case "February":
        month = "Feb";
        break;
      case "March":
        month = "March";
        break;
      case "April":
        month = "April";
        break;
      case "May":
        month = "May";
        break;
      case "June":
        month = "June";
        break;
      case "July":
        month = "July";
        break;
      case "August":
        month = "Aug";
        break;
      case "September":
        month = "Sep";
        break;
      case "October":
        month = "Oct";
        break;
      case "November":
        month = "Nov";
        break;
      case "December":
        month = "Dec";
        break;
      default:
        month = "Jan";
    }
    _hrmRepoModel.getString(EMPLOYEE_ID).then((id) {
      _hrmRepoModel.getString(GENDER).then((gender) {
        this.gender = gender;
        _notifySafely();
        _hrmRepoModel

            /// Sep will be replaced later with month variable
            .postEmployeeLeavesAndDateDetails(id, month)
            .then((response) {
          apiDateList = response.data?.map((e) {
            String dateString =
                e.date?.substring(0, 19).replaceAll("T", " ") ?? "";
            var dateTime =
                DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString, true);
            var dateLocal = dateTime.toLocal();
            e.date = dateLocal.toString().substring(0, 10);
            return e;
          }).toList();
          if (apiDateList != null) {
            var dateUtc = DateTime.now().toUtc();
            var dateLocal = dateUtc.toLocal();
            allDaysForMonth = List.generate(

                /// 9 will be replaced with dateLocal.month
                _getDaysInMonth(dateLocal.year, dateLocal.month), (index) {
              return DateDetailVO(
                /// 9 will be replaced with dateLocal.month
                date: DateTime(dateLocal.year, dateLocal.month, index + 1)
                    .toString()
                    .substring(0, 10),
                clockIn: "",
                clockOut: "",
              );
            });
            Map<String, String> updatedTimeMap = Map.fromIterable(
                apiDateList as Iterable<DateDetailVO>,
                key: (apiDate) => apiDate.date,
                value: (apiDate) =>
                    "${apiDate.clockIn ?? ""}/${apiDate.clockOut ?? ""}/${apiDate.type ?? ""}/${apiDate.source ?? ""}");

            for (int i = 0; i < allDaysForMonth.length; i++) {
              String dateAsString = allDaysForMonth[i].date ?? "";
              if (updatedTimeMap.containsKey(dateAsString)) {
                List<String> list = updatedTimeMap[dateAsString]!.split("/");
                allDaysForMonth[i].clockIn = list[0];
                allDaysForMonth[i].clockOut = list[1];
                allDaysForMonth[i].type = list[2];
                allDaysForMonth[i].source = list[3];
                _notifySafely();
              }
            }
            attend = apiDateList
                    ?.where((element) =>
                        element.type == "Attend" &&
                        element.attendType == "Week Day")
                    .toList()
                    .length ??
                0;

            dismiss = apiDateList
                    ?.where((element) =>
                        element.type == "Dismiss" && element.source != "Leave")
                    .toList()
                    .length ??
                0;
            leave = apiDateList
                    ?.where((element) =>
                        element.type == "Dismiss" && element.source == "Leave")
                    .toList()
                    .length ??
                0;
            holiday = apiDateList
                    ?.where((element) =>
                        element.attendType == "Day Off" ||
                        element.attendType == "Holiday")
                    .toList()
                    .length ??
                0;
            _notifySafely();
          }
          _hrmRepoModel.getEmployeeData().then((response) {
            userDataVO = response.user;
            _notifySafely();
            _hrmRepoModel
                .postRealTimePayRoll(
                    userDataVO?.sId ?? "",
                    userDataVO?.relatedDepartment?.sId ?? "",

                    /// "Sep" will be replaced with month variable later
                    month,
                    userDataVO?.relatedPosition?.basicSalary ?? 0)
                .then((realTimeResponse) {
              realTimePayRollVO = realTimeResponse.data;
              _notifySafely();
              _hideLoading();
            });
          });
        });
      });
    });
  }

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  /// loading situations
  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
