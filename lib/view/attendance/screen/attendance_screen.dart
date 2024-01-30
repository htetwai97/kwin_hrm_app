import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/view/attendance/bloc/attendance_bloc.dart';
import 'package:hr_management_application/view/attendance/widgets/attendance_title_and_back_arrow_view.dart';
import 'package:hr_management_application/view/attendance/widgets/chip_row_view.dart';
import 'package:hr_management_application/view/attendance/widgets/monthly_attendance_card_view.dart';
import 'package:hr_management_application/view/attendance/widgets/title_monthly_view.dart';
import 'package:hr_management_application/view/attendance_detail/screen/attendance_detail_screen.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: ChangeNotifierProvider(
        create: (context) => AttendanceBloc(),
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(scaleWidth(context), 80),
              child: AttendanceTitleAndBackArrowView(
                title: "Your Attendance",
                onTapBack: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Selector<AttendanceBloc, bool>(
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        const ColoredTitleForAttendanceView(
                          title: "Monthly",
                        ),
                        const SizedBox(height: 20),
                        Consumer<AttendanceBloc>(
                          builder: (context, bloc, child) => ListView.separated(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: bloc.monthList?.length ?? 0,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              return MonthlyAttendanceCardView(
                                month: bloc.monthList?[index].month ?? "",
                                attendPercent:
                                    bloc.monthList?[index].attended ?? 0,
                                onTapDetail: () {
                                  Functions.rightToLeftTransition(
                                      context,
                                      AttendanceDetailScreen(
                                          month: bloc.monthList?[index].month ??
                                              ""));
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              selector: (context, bloc) => bloc.isLoading,
            ),
          ),
        ),
      ),
    );
  }
}
