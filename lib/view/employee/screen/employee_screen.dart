import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/data/vo/user_data_vo.dart';
import 'package:hr_management_application/view/attendance/screen/attendance_screen.dart';
import 'package:hr_management_application/view/employee/widgets/employee_choice_row_view.dart';
import 'package:hr_management_application/view/employee/widgets/header_employee_page_view.dart';
import 'package:hr_management_application/view/leave/screen/leave_screen.dart';
import 'package:hr_management_application/view/payslip/screen/payslip_screen.dart';
import 'package:hr_management_application/view/profile/screen/profile_screen.dart';
import 'package:hr_management_application/view/real_time_payroll/screen/realtime_payroll_screen.dart';
import 'package:hr_management_application/view/roll_call_kwin/screen/roll_call_kwin_screen.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  UserDataVO? userDataVO;
  bool isLoading = false;
  HRMRepoModel hrmRepoModel = HRMRepoModelImpl();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    hrmRepoModel.getEmployeeData().then((employeeData) {
      userDataVO = employeeData.user;
      isLoading = false;
      setState(() {});
    }).onError((error, stackTrace) {
      Functions.toast(msg: "Dio Employee data error", status: false);
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderEmployeePageView(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      EmployeeChoiceRowView(
                        titleOne: "Profile",
                        titleTwo: "Your Attendance",
                        imageOne: "assets/images/hr_profile.png",
                        imageTwo: "assets/images/hr_attendance.png",
                        onTapOne: () {
                          Functions.transition(context, const ProfileScreen());
                        },
                        onTapTwo: () {
                          Functions.transition(
                              context, const AttendanceScreen());
                        },
                      ),
                      const SizedBox(height: 20),
                      EmployeeChoiceRowView(
                        titleOne: "Leave",
                        titleTwo: "Roll Call",
                        imageOne: "assets/images/hr_leave_image_jpeg.jpg",
                        imageTwo: "assets/images/hrm_roll_call.png",
                        onTapOne: () {
                          Functions.transition(context, const LeaveScreen());
                        },
                        onTapTwo: () {
                          Functions.replacementTransition(
                            context,
                            RollCallKWinScreen(
                              userDataVO: userDataVO,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      EmployeeChoiceRowView(
                        titleOne: "PaySlip",
                        titleTwo: "Real Time Payroll",
                        imageOne: "assets/images/hr_payslip.jpg",
                        imageTwo: "assets/images/hr_realtimepayment.png",
                        onTapOne: () {
                          Functions.transition(context, const PayslipScreen());
                        },
                        onTapTwo: () {
                          Functions.transition(
                              context, const RealTimePayRollScreen());
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
