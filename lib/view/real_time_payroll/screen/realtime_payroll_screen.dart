// import 'package:flutter/material.dart';
// import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
// import 'package:hr_management_application/core/core_config/config_color.dart';
// import 'package:hr_management_application/core/core_config/config_dimension.dart';
// import 'package:hr_management_application/core/core_config/config_style.dart';
// import 'package:hr_management_application/core/core_functions/functions.dart';
// import 'package:hr_management_application/view/payslip/widgets/payslip_text_row_view.dart';
// import 'package:hr_management_application/view/real_time_payroll/bloc/real_time_payroll_bloc.dart';
// import 'package:hr_management_application/view/real_time_payroll/widgets/bar_chart_section_view.dart';
// import 'package:hr_management_application/view/real_time_payroll/widgets/leave_row_view.dart';
// import 'package:hr_management_application/view/real_time_payroll/widgets/present_absent_holiday_view.dart';
// import 'package:provider/provider.dart';
//
// class RealTimePayRollScreen extends StatelessWidget {
//   const RealTimePayRollScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var halfHeight = scaleHeight(context) / 2.7;
//     return ScaffoldWithConnectionStatus(
//       child: ChangeNotifierProvider(
//         create: (context) => RealTimePayRollBloc(),
//         child: SafeArea(
//           child: Scaffold(
//             backgroundColor: APP_THEME_COLOR,
//             body: Selector<RealTimePayRollBloc, bool>(
//                 builder: (context, isLoading, child) {
//                   if (isLoading) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else {
//                     return SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: const Icon(
//                               Icons.close,
//                               size: DIMEN_TWENTY_EIGHT,
//                               color: MATERIAL_COLOR,
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.center,
//                             child: Text(
//                               "Realtime Payroll",
//                               style: ConfigStyle.regularStyleThree(
//                                 DIMEN_TWENTY_TWO,
//                                 MATERIAL_COLOR,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: scaleHeight(context) / 30),
//                           Container(
//                             //margin: const EdgeInsets.symmetric(horizontal: 10),
//                             width: scaleWidth(context),
//                             decoration: BoxDecoration(
//                               color: MATERIAL_COLOR,
//                               borderRadius: const BorderRadius.only(
//                                 topRight: Radius.circular(24),
//                                 topLeft: Radius.circular(24),
//                               ),
//                               boxShadow: [
//                                 Functions.buildBoxShadow(),
//                               ],
//                             ),
//                             child: Column(
//                               children: [
//                                 const SizedBox(height: 6),
//                                 Container(
//                                   height: 5,
//                                   width: 70,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black12,
//                                     borderRadius: BorderRadius.circular(50),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 const Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 14),
//                                   child: PayslipTextRowView(
//                                     title: "Working hour",
//                                     value: "This Month",
//                                     isSwitch: true,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(horizontal: 8),
//                                   child: SizedBox(
//                                     height: halfHeight + 20,
//                                     child: SingleChildScrollView(
//                                       physics:
//                                           const AlwaysScrollableScrollPhysics(),
//                                       scrollDirection: Axis.horizontal,
//                                       child: Consumer<RealTimePayRollBloc>(
//                                         builder: (context, bloc, child) =>
//                                             BarChartSectionView(
//                                           halfHeight: halfHeight,
//                                           dateList: bloc.allDaysForMonth,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 16,
//                                       width: 16,
//                                       color: Colors.red,
//                                     ),
//                                     Text(
//                                       "   =  no clock out",
//                                       style: ConfigStyle.boldStyleThree(
//                                         DIMEN_FOURTEEN,
//                                         LOGIN_BUTTON_COLOR,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20),
//                                 const Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 14),
//                                   child: PayslipTextRowView(
//                                     title: "Working day",
//                                     value: "This month",
//                                     isSwitch: true,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 // Consumer<RealTimePayRollBloc>(
//                                 //   builder: (context, bloc, child) =>
//                                 //       PresentAbsentHolidayView(
//                                 //     titleOne: "Attend",
//                                 //     titleTwo: "Dismiss",
//                                 //     titleThree: "Leave",
//                                 //     valueOne: "19",
//                                 //     valueTwo: "02",
//                                 //     valueThree: "02",
//                                 //   ),
//                                 // ),
//                                 //const SizedBox(height: 20),
//                                 Consumer<RealTimePayRollBloc>(
//                                   builder: (context, bloc, child) =>
//                                       LeaveRowView(
//                                     titleOne: "Attend",
//                                     titleTwo: "Leaves",
//                                     valueOne: bloc.attend.toString(),
//                                     valueTwo: bloc.leave.toString(),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Consumer<RealTimePayRollBloc>(
//                                   builder: (context, bloc, child) =>
//                                       LeaveRowView(
//                                     titleOne: "Holiday",
//                                     titleTwo: "Dismiss",
//                                     valueOne: bloc.holiday.toString(),
//                                     valueTwo: bloc.dismiss.toString(),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 const Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 14),
//                                   child: PayslipTextRowView(
//                                     title: "Current Payroll",
//                                     value: "This month",
//                                     isSwitch: true,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Consumer<RealTimePayRollBloc>(
//                                   builder: (context, bloc, child) =>
//                                       PresentAbsentHolidayView(
//                                     titleOne: "Gross",
//                                     titleTwo: "Deduction",
//                                     titleThree: "Net",
//                                     valueOne: bloc
//                                             .realTimePayRollVO?.attendedSalary
//                                             ?.toString() ??
//                                         "",
//                                     valueTwo: bloc
//                                             .realTimePayRollVO?.dismissedSalary
//                                             ?.toString() ??
//                                         "",
//                                     valueThree: bloc
//                                             .realTimePayRollVO?.entitledSalary
//                                             ?.toString() ??
//                                         "",
//                                   ),
//                                 ),
//                                 const SizedBox(height: 40),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                 },
//                 selector: (context, bloc) => bloc.isLoading),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hrm_medical_world_app_two/connection_test_service/scaffold_with_connection_status.dart';
// import 'package:hrm_medical_world_app_two/core/core_config/config_color.dart';
// import 'package:hrm_medical_world_app_two/core/core_config/config_dimension.dart';
// import 'package:hrm_medical_world_app_two/core/core_config/config_style.dart';
// import 'package:hrm_medical_world_app_two/core/core_functions/functions.dart';
// import 'package:hrm_medical_world_app_two/view/payslip/widgets/payslip_text_row_view.dart';
// import 'package:hrm_medical_world_app_two/view/real_time_payroll/bloc/real_time_payroll_bloc.dart';
// import 'package:hrm_medical_world_app_two/view/real_time_payroll/widgets/bar_chart_section_view.dart';
// import 'package:hrm_medical_world_app_two/view/real_time_payroll/widgets/leave_row_view.dart';
// import 'package:hrm_medical_world_app_two/view/real_time_payroll/widgets/present_absent_holiday_view.dart';
// import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/view/payslip/widgets/payslip_text_row_view.dart';
import 'package:hr_management_application/view/real_time_payroll/bloc/real_time_payroll_bloc.dart';
import 'package:hr_management_application/view/real_time_payroll/widgets/bar_chart_section_view.dart';
import 'package:hr_management_application/view/real_time_payroll/widgets/leave_row_view.dart';
import 'package:hr_management_application/view/real_time_payroll/widgets/present_absent_holiday_view.dart';
import 'package:provider/provider.dart';

class RealTimePayRollScreen extends StatelessWidget {
  const RealTimePayRollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var halfHeight = scaleHeight(context) / 2.7;
    return ScaffoldWithConnectionStatus(
      child: ChangeNotifierProvider(
        create: (context) => RealTimePayRollBloc(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: APP_THEME_COLOR,
            body: Selector<RealTimePayRollBloc, bool>(
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
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              size: DIMEN_TWENTY_EIGHT,
                              color: MATERIAL_COLOR,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Realtime Payroll",
                              style: ConfigStyle.regularStyleThree(
                                DIMEN_TWENTY_TWO,
                                MATERIAL_COLOR,
                              ),
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                          Container(
                            //margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: scaleWidth(context),
                            decoration: BoxDecoration(
                              color: MATERIAL_COLOR,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24),
                              ),
                              boxShadow: [
                                Functions.buildBoxShadow(),
                              ],
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 6),
                                Container(
                                  height: 5,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child: PayslipTextRowView(
                                    title: "Working hour",
                                    value: "This Month",
                                    isSwitch: true,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: SizedBox(
                                    height: halfHeight + 20,
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Consumer<RealTimePayRollBloc>(
                                        builder: (context, bloc, child) =>
                                            BarChartSectionView(
                                          halfHeight: halfHeight,
                                          dateList: bloc.allDaysForMonth,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 16,
                                      width: 16,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      "   =  no clock out",
                                      style: ConfigStyle.boldStyleThree(
                                        DIMEN_FOURTEEN,
                                        LOGIN_BUTTON_COLOR,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child: PayslipTextRowView(
                                    title: "Working day",
                                    value: "This month",
                                    isSwitch: true,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Consumer<RealTimePayRollBloc>(
                                //   builder: (context, bloc, child) =>
                                //       PresentAbsentHolidayView(
                                //     titleOne: "Attend",
                                //     titleTwo: "Dismiss",
                                //     titleThree: "Leave",
                                //     valueOne: "19",
                                //     valueTwo: "02",
                                //     valueThree: "02",
                                //   ),
                                // ),
                                //const SizedBox(height: 20),
                                Consumer<RealTimePayRollBloc>(
                                  builder: (context, bloc, child) =>
                                      LeaveRowView(
                                    titleOne: "Attend",
                                    titleTwo: "Leaves",
                                    valueOne: bloc.attend.toString(),
                                    valueTwo: bloc.leave.toString(),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Consumer<RealTimePayRollBloc>(
                                  builder: (context, bloc, child) =>
                                      LeaveRowView(
                                    titleOne: "Holiday",
                                    titleTwo: "Dismiss",
                                    valueOne: bloc.holiday.toString(),
                                    valueTwo: bloc.dismiss.toString(),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child: PayslipTextRowView(
                                    title: "Current Payroll",
                                    value: "This month",
                                    isSwitch: true,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Consumer<RealTimePayRollBloc>(
                                  builder: (context, bloc, child) =>
                                      PresentAbsentHolidayView(
                                    titleOne: "Gross",
                                    titleTwo: "Deduction",
                                    titleThree: "Net",
                                    valueOne: bloc
                                            .realTimePayRollVO?.attendedSalary
                                            ?.toString() ??
                                        "",
                                    valueTwo: bloc
                                            .realTimePayRollVO?.dismissedSalary
                                            ?.toString() ??
                                        "",
                                    valueThree: bloc
                                            .realTimePayRollVO?.entitledSalary
                                            ?.toString() ??
                                        "",
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
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
