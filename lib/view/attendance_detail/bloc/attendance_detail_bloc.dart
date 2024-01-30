import 'package:flutter/foundation.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/data/vo/date_detail_vo.dart';
import 'package:hr_management_application/data/vo/employee_leaves_vo.dart';
import 'package:hr_management_application/persistence/share_preference/share_preference_key_constants.dart';
import 'package:intl/intl.dart';

class AttendanceDetailBloc extends ChangeNotifier {
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
  int monthIndex = 0;

  AttendanceDetailBloc(String month) {
    _showLoading();
    switch (month) {
      case "Jan":
        monthIndex = 1;
        break;
      case "Feb":
        monthIndex = 2;
        break;
      case "March":
        monthIndex = 3;
        break;
      case "April":
        monthIndex = 4;
        break;
      case "May":
        monthIndex = 5;
        break;
      case "June":
        monthIndex = 6;
        break;
      case "July":
        monthIndex = 7;
        break;
      case "Aug":
        monthIndex = 8;
        break;
      case "Sep":
        monthIndex = 9;
        break;
      case "Oct":
        monthIndex = 10;
        break;
      case "Nov":
        monthIndex = 11;
        break;
      case "Dec":
        monthIndex = 12;
        break;
      default:
        monthIndex = 1;
    }
    _hrmRepoModel.getString(EMPLOYEE_ID).then((id) {
      _hrmRepoModel.getString(GENDER).then((gender) {
        this.gender = gender;
        _notifySafely();
        _hrmRepoModel
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
                _getDaysInMonth(dateLocal.year, monthIndex), (index) {
              return DateDetailVO(
                date: DateTime(dateLocal.year, monthIndex, index + 1)
                    .toString()
                    .substring(0, 10),
                type: "m",
              );
            });
            debugPrint(allDaysForMonth.toString());
            Map<String, String> updatedTypeAndSourceMap = Map.fromIterable(
                apiDateList as Iterable<DateDetailVO>,
                key: (apiDate) => apiDate.date,
                value: (apiDate) =>
                    "${apiDate.type ?? ""}/${apiDate.source ?? ""}/${apiDate.clockIn ?? ""}/${apiDate.clockOut ?? ""}/${apiDate.attendType ?? ""}");

            for (int i = 0; i < allDaysForMonth.length; i++) {
              String dateAsString = allDaysForMonth[i].date ?? "";
              if (updatedTypeAndSourceMap.containsKey(dateAsString)) {
                List<String> list =
                    updatedTypeAndSourceMap[dateAsString]!.split("/");
                allDaysForMonth[i].type = list[0];
                allDaysForMonth[i].source = list[1];
                allDaysForMonth[i].clockIn = list[2];
                allDaysForMonth[i].clockOut = list[3];
                allDaysForMonth[i].attendType = list[4];
                _notifySafely();
              }
            }
            _notifySafely();
          }
          employeeLeaves = response.employee;
          _notifySafely();
          _hideLoading();
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
