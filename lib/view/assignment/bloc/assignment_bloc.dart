import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/data/vo/data_from_appointment_vo.dart';
import 'package:hr_management_application/data/vo/user_data_vo.dart';
import 'package:hr_management_application/network/responses/get_appointment_list_response.dart';
import 'package:hr_management_application/persistence/share_preference/share_preference_key_constants.dart';
import 'package:hr_management_application/view/logout_loading/screen/logout_loading_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AssignmentBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HRMRepoModel _hrmRepoModel = HRMRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  UserDataVO? userDataVO;
  double boxOneWidth = 130;
  double boxOneVerticalMargin = 0;
  double boxTwoWidth = 120;
  double boxTwoVerticalMargin = 10;
  double boxThreeWidth = 120;
  double boxThreeVerticalMargin = 10;
  IconData iconData = MdiIcons.stackOverflow;
  Color iconColor = CATEGORY_ONE_COLOR_ONE;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController controller = ScrollController();
  double? min;
  double? max;
  double? direction;
  bool isDueToday = false;
  int category = 1;
  String? employeeId;
  List<DataFromAppointmentVO> overDueAppointmentList = [];
  List<DataFromAppointmentVO> upcomingAppointmentList = [];
  List<DataFromAppointmentVO> dueTodayAppointmentList = [];
  List<DataFromAppointmentVO> displayAppointmentList = [];
  String warning = "No overdue appointments";
  bool isCompleteAll = false;

  AssignmentBloc() {
    _showLoading();
    _hrmRepoModel.getString(EMPLOYEE_ID).then((value) {
      employeeId = value;
      _notifySafely();
      _hrmRepoModel.getEmployeeData().then((response) {
        userDataVO = response.user;
        min = controller.position.minScrollExtent;
        max = controller.position.maxScrollExtent;
        _notifySafely();
        _hrmRepoModel.getAppointment().then((value) {
          overDueAppointmentList = _getOverDueAppointments(value);
          upcomingAppointmentList = _getUpcomingAppointments(value);
          dueTodayAppointmentList = _getDueTodayAppointments(value);
          displayAppointmentList = overDueAppointmentList;
          _notifySafely();
          _hideLoading();
        });
      });
    });
  }

  void onSearch(String text) {
    if (category == 1) {
      displayAppointmentList =
          _searchAppointments(overDueAppointmentList, text);
      _notifySafely();
    } else if (category == 2) {
      displayAppointmentList =
          _searchAppointments(upcomingAppointmentList, text);
      _notifySafely();
    } else {
      displayAppointmentList =
          _searchAppointments(dueTodayAppointmentList, text);
      _notifySafely();
    }
  }

  void onTapLogOut(BuildContext context) {
    Functions.logoutDialog(context, 100, () {
      Navigator.pop(context);
    }, () {
      _hrmRepoModel.clearAllSharePrefItems().then((value) {
        if (value == true) {
          Functions.replacementTransition(context, const LogoutLoadingScreen());
        } else {
          Functions.toast(msg: "Logout failed", status: false);
        }
      });
    }, "Are you Sure?", "You will be logout from the application.", "Cancel",
        "OK");
  }

  List<DataFromAppointmentVO> _searchAppointments(
      List<DataFromAppointmentVO> list, String text) {
    var appointmentList = list
        .where((element) =>
            element.customer?.name
                ?.toLowerCase()
                .contains(text.toLowerCase()) ??
            false)
        .toList();
    return appointmentList;
  }

  List<DataFromAppointmentVO> _getOverDueAppointments(
      GetAppointmentResponse value) {
    var list = value.data;
    return list?.where((element) {
          var todayString = DateTime.now().toString().substring(0, 10);
          DateTime todayDate = DateTime.parse(todayString);
          String date = element.date?.substring(0, 10) ?? "";
          DateTime dateTime = DateTime.parse(date);
          return element.employee?.sId == employeeId &&
              dateTime.isBefore(todayDate);
        }).toList() ??
        [];
  }

  List<DataFromAppointmentVO> _getUpcomingAppointments(
      GetAppointmentResponse value) {
    var list = value.data;
    return list?.where((element) {
          var todayString = DateTime.now().toString().substring(0, 10);
          DateTime todayDate = DateTime.parse(todayString);
          String date = element.date?.substring(0, 10) ?? "";
          DateTime dateTime = DateTime.parse(date);
          return element.employee?.sId == employeeId &&
              dateTime.isAfter(todayDate);
        }).toList() ??
        [];
  }

  List<DataFromAppointmentVO> _getDueTodayAppointments(
      GetAppointmentResponse value) {
    var list = value.data;
    return list?.where((element) {
          var todayString = DateTime.now().toString().substring(0, 10);
          DateTime todayDate = DateTime.parse(todayString);
          String date = element.date?.substring(0, 10) ?? "";
          DateTime dateTime = DateTime.parse(date);
          return element.employee?.sId == employeeId &&
              dateTime.isAtSameMomentAs(todayDate);
        }).toList() ??
        [];
  }

  void onTapOverdue() {
    category = 1;
    boxOneWidth = 130;
    boxOneVerticalMargin = 0;
    boxTwoWidth = 120;
    boxTwoVerticalMargin = 10;
    boxThreeWidth = 120;
    boxThreeVerticalMargin = 10;
    iconData = MdiIcons.stackOverflow;
    iconColor = CATEGORY_ONE_COLOR_TWO;
    direction = min;
    isDueToday = false;
    _animateScroll();
    displayAppointmentList = overDueAppointmentList;
    warning = "No overdue appointments";
    _notifySafely();
  }

  void onTapUpcoming() {
    category = 2;
    boxOneWidth = 120;
    boxOneVerticalMargin = 10;
    boxTwoWidth = 130;
    boxTwoVerticalMargin = 0;
    boxThreeWidth = 120;
    boxThreeVerticalMargin = 10;
    iconData = MdiIcons.inboxArrowDownOutline;
    iconColor = CATEGORY_TWO_COLOR_TWO;
    direction = direction == max ? min : max;
    isDueToday = false;
    _animateScroll();
    displayAppointmentList = upcomingAppointmentList;
    warning = "No upcoming appointments";
    _notifySafely();
  }

  void onTapDueToday() {
    category = 3;
    boxOneWidth = 120;
    boxOneVerticalMargin = 10;
    boxTwoWidth = 120;
    boxTwoVerticalMargin = 10;
    boxThreeWidth = 130;
    boxThreeVerticalMargin = 0;
    iconData = MdiIcons.calendarToday;
    iconColor = CATEGORY_THREE_COLOR_TWO;
    direction = max;
    isDueToday = true;
    _animateScroll();
    displayAppointmentList = dueTodayAppointmentList;
    warning = "No due today appointments";
    _notifySafely();
  }

  void _animateScroll() {
    controller.animateTo(direction ?? 0,
        duration: const Duration(milliseconds: 1000), curve: Curves.decelerate);
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
