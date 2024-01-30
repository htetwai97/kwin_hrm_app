import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/view/attendance/widgets/attendance_title_and_back_arrow_view.dart';
import 'package:hr_management_application/view/attendance/widgets/title_monthly_view.dart';
import 'package:hr_management_application/view/attendance_detail/bloc/attendance_detail_bloc.dart';
import 'package:hr_management_application/view/attendance_detail/widgets/color_explain_section_detail_view.dart';
import 'package:hr_management_application/view/attendance_detail/widgets/date_box_list_view.dart';
import 'package:hr_management_application/view/attendance_detail/widgets/leave_boxes_row_view.dart';
import 'package:provider/provider.dart';

class AttendanceDetailScreen extends StatelessWidget {
  final String month;
  const AttendanceDetailScreen({
    Key? key,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: ChangeNotifierProvider(
        create: (context) => AttendanceDetailBloc(month),
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(scaleWidth(context), 80),
              child: AttendanceTitleAndBackArrowView(
                title: "Attendance Detail",
                onTapBack: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Selector<AttendanceDetailBloc, bool>(
                builder: (context, isLoading, child) {
                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          ColoredTitleForAttendanceView(
                            title: "Attendance for $month",
                          ),
                          const SizedBox(height: 30),
                          Consumer<AttendanceDetailBloc>(
                            builder: (context, bloc, child) => DateBoxListView(
                              month: month,
                              dateList: bloc.allDaysForMonth,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const ColorExplainSectionDetailView(),
                          SizedBox(
                            height: 80,
                            child: Center(
                              child: Container(
                                height: 0.6,
                                decoration: const BoxDecoration(
                                  color: BLACK_LIGHT,
                                ),
                              ),
                            ),
                          ),
                          // const ColoredTitleForAttendanceView(
                          //   title: "Announcements For July",
                          // ),
                          // const SizedBox(height: 20),
                          // const AnnouncementListView(),
                          // SizedBox(
                          //   height: 40,
                          //   child: Center(
                          //     child: Container(
                          //       height: 0.2,
                          //       color: BLACK_LIGHT,
                          //     ),
                          //   ),
                          // ),
                          ColoredTitleForAttendanceView(
                            title: "For ${DateTime.now().year}",
                          ),
                          Consumer<AttendanceDetailBloc>(
                            builder: (context, bloc, child) => LeaveBoxesRowView(
                              causal:
                                  bloc.employeeLeaves?.casualLeaves?.toString() ??
                                      "",
                              medical: bloc.employeeLeaves?.medicalLeaves
                                      ?.toString() ??
                                  "",
                              maternal: (bloc.gender == "Male")
                                  ? bloc.employeeLeaves?.maternityLeaveMale
                                          ?.toString() ??
                                      ""
                                  : bloc.employeeLeaves?.maternityLeaveFemale
                                          ?.toString() ??
                                      "",
                              vacation: bloc.employeeLeaves?.vacationLeaves
                                      ?.toString() ??
                                  "",
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    );
                  }
                },
                selector: (context, bloc) => bloc.isLoading),
          ),
        ),
      ),
    );
  }
}
