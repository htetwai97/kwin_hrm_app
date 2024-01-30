import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_strings.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/vo/user_data_vo.dart';
import 'package:hr_management_application/network/api_service/api_constants.dart';
import 'package:hr_management_application/view/assignment/bloc/assignment_bloc.dart';
import 'package:hr_management_application/view/assignment/widgets/category_box_detail_view.dart';
import 'package:hr_management_application/view/assignment/widgets/drawer_property_list_view.dart';
import 'package:hr_management_application/view/assignment/widgets/greeting_view.dart';
import 'package:hr_management_application/view/assignment/widgets/search_textfield_view.dart';
import 'package:hr_management_application/view/assignment/widgets/profile_and_menu_view.dart';
import 'package:hr_management_application/view/assignment/widgets/task_list_tile_view.dart';
import 'package:hr_management_application/view/marketing_report/screen/marketing_report_screen.dart';
import 'package:hr_management_application/view/profile/screen/profile_screen.dart';
import 'package:hr_management_application/view/roll_call/screen/rollcall_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: ChangeNotifierProvider(
        create: (context) => AssignmentBloc(),
        child: Selector<AssignmentBloc, GlobalKey<ScaffoldState>>(
          selector: (context, bloc) => bloc.scaffoldKey,
          builder: (context, scaffoldKey, child) =>
              Selector<AssignmentBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) {
              return Stack(
                children: [
                  Container(
                    color: MATERIAL_COLOR,
                    child: SafeArea(
                      child: Scaffold(
                        key: scaffoldKey,
                        backgroundColor: LOGIN_BUTTON_COLOR,
                        drawer: Drawer(
                          width: scaleWidth(context) / 1.4,
                          child: Consumer<AssignmentBloc>(
                            builder: (context, bloc, child) =>
                                DrawerPropertyListView(
                              onTapLogOut: () {
                                bloc.onTapLogOut(context);
                              },
                            ),
                          ),
                        ),
                        appBar: AppBar(
                          backgroundColor: LOGIN_BUTTON_COLOR,
                          elevation: 0.0,
                          actions: [
                            Consumer<AssignmentBloc>(
                              builder: (context, bloc, child) => Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, top: 4, bottom: 4),
                                child: InkWell(
                                  radius: 100,
                                  highlightColor: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(45),
                                  onTap: () {
                                    Functions.transition(
                                        context, const ProfileScreen());
                                  },
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundImage: NetworkImage(
                                      (bloc.userDataVO?.profilePic?.length != 0)
                                          ? "$IMAGE_BASE_URL${bloc.userDataVO?.profilePic?.last.imgUrl ?? PROFILE_PLACE_HOLDER}"
                                          : PROFILE_PLACE_HOLDER,
                                    ),
                                    onBackgroundImageError: (obj,trace){

                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // appBar: PreferredSize(
                        //   preferredSize: Size(scaleWidth(context), 120),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 20, right: 20, top: 10, bottom: 10),
                        //     child: Selector<AssignmentBloc, UserDataVO?>(
                        //         selector: (context, bloc) => bloc.userDataVO,
                        //         builder: (context, userData, child) {
                        //           return ProfileAndMenuView(
                        //             image:
                        //                 "$IMAGE_BASE_URL${userData?.profilePic?[0].imgUrl ?? ""}",
                        //             onTapMenu: () {
                        //               scaffoldKey.currentState?.openDrawer();
                        //             },
                        //             onTapProfile: () {
                        //               Functions.transition(
                        //                   context, const ProfileScreen());
                        //             },
                        //           );
                        //         }),
                        //   ),
                        // ),
                        body: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: DIMEN_TWENTY),
                                child: Selector<AssignmentBloc, UserDataVO?>(
                                  selector: (context, bloc) => bloc.userDataVO,
                                  builder: (context, userData, child) =>
                                      GreetingView(
                                    name: userData?.givenName ?? "",
                                  ),
                                ),
                              ),
                              const SizedBox(height: DIMEN_TWENTY),
                              Consumer<AssignmentBloc>(
                                builder: (context, bloc, child) =>
                                    SearchTextFieldView(
                                  onChanged: (text) {
                                    bloc.onSearch(text);
                                  },
                                ),
                              ),
                              const SizedBox(height: DIMEN_TWENTY),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: DIMEN_TWENTY),
                                child: Text(
                                  "Category",
                                  style: ConfigStyle.regularStyleTwo(
                                    DIMEN_TWENTY_TWO,
                                    MATERIAL_COLOR,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox(
                                  height: 160,
                                  child: Consumer<AssignmentBloc>(
                                    builder: (context, bloc, child) => ListView(
                                      controller: bloc.controller,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        CategoryBoxDetailView(
                                          width: bloc.boxOneWidth,
                                          verticalMargin:
                                              bloc.boxOneVerticalMargin,
                                          colorOne: CATEGORY_ONE_COLOR_ONE,
                                          colorTwo: CATEGORY_ONE_COLOR_TWO,
                                          iconData: MdiIcons.stackOverflow,
                                          name: "Overdue",
                                          taskQuantity:
                                              "${bloc.overDueAppointmentList.length} appointments",
                                          onTap: () {
                                            bloc.onTapOverdue();
                                          },
                                        ),
                                        const SizedBox(width: 20),
                                        CategoryBoxDetailView(
                                          width: bloc.boxTwoWidth,
                                          verticalMargin:
                                              bloc.boxTwoVerticalMargin,
                                          colorOne: CATEGORY_TWO_COLOR_ONE,
                                          colorTwo: CATEGORY_TWO_COLOR_TWO,
                                          iconData:
                                              MdiIcons.inboxArrowDownOutline,
                                          name: "Upcoming",
                                          taskQuantity:
                                              "${bloc.upcomingAppointmentList.length} appointments",
                                          onTap: () {
                                            bloc.onTapUpcoming();
                                          },
                                        ),
                                        const SizedBox(width: 20),
                                        CategoryBoxDetailView(
                                          width: bloc.boxThreeWidth,
                                          verticalMargin:
                                              bloc.boxThreeVerticalMargin,
                                          colorOne: CATEGORY_THREE_COLOR_ONE,
                                          colorTwo: CATEGORY_THREE_COLOR_TWO,
                                          iconData: MdiIcons.calendarToday,
                                          name: "Due Today",
                                          taskQuantity:
                                              "${bloc.dueTodayAppointmentList.length} appointments",
                                          onTap: () {
                                            bloc.onTapDueToday();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: DIMEN_TWENTY),
                              Consumer<AssignmentBloc>(
                                  builder: (context, bloc, child) {
                                if (bloc.displayAppointmentList.isEmpty) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 50),
                                      child: Column(
                                        children: [
                                          Icon(
                                            bloc.iconData,
                                            color: MATERIAL_COLOR,
                                            size: 60,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            bloc.warning,
                                            style: ConfigStyle.regularStyleTwo(
                                              16,
                                              MATERIAL_COLOR,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(40),
                                      ),
                                      boxShadow: [
                                        Functions.buildBoxShadow(),
                                      ],
                                      color: MATERIAL_COLOR,
                                    ),
                                    child: ListView.separated(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: DIMEN_TWENTY),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var isDueToday = bloc.isDueToday;
                                        var appointment =
                                            bloc.displayAppointmentList[index];
                                        return TaskListTileView(
                                          isDueToday: isDueToday,
                                          reportStatus:
                                              (appointment.reported ?? false),
                                          checkInStatus:
                                              appointment.checkIn ?? false,
                                          checkOutStatus:
                                              appointment.checkOut ?? false,
                                          name:
                                              appointment.customer?.name ?? "",
                                          date: appointment.date
                                              ?.substring(0, 10),
                                          iconData: bloc.iconData,
                                          iconColor: bloc.iconColor,
                                          isCompleteAll: isDueToday &&
                                              appointment.checkIn == true &&
                                              appointment.checkOut == true &&
                                              appointment.reported == true,
                                          onTapCheckIn: () {
                                            if (isDueToday &&
                                                appointment.checkIn == false) {
                                              Functions.transition(
                                                context,
                                                RollCallScreen(
                                                  customerName: appointment
                                                          .customer?.name ??
                                                      "",
                                                  isCheckedIn: true,
                                                  appointmentId:
                                                      appointment.sId ?? "",
                                                  attendanceId: appointment
                                                          .attendanceId ??
                                                      "",
                                                  referenceLat:
                                                      appointment.latitude ?? 0,
                                                  referenceLon:
                                                      appointment.longitude ??
                                                          0,
                                                ),
                                              );
                                            }
                                          },
                                          onTapCheckOut: () {
                                            if (isDueToday &&
                                                appointment.checkOut == false) {
                                              Functions.transition(
                                                context,
                                                RollCallScreen(
                                                  customerName: appointment
                                                          .customer?.name ??
                                                      "",
                                                  appointmentId:
                                                      appointment.sId ?? "",
                                                  isCheckedIn: false,
                                                  attendanceId: appointment
                                                          .attendanceId ??
                                                      "",
                                                  referenceLat:
                                                      appointment.latitude ?? 0,
                                                  referenceLon:
                                                      appointment.longitude ??
                                                          0,
                                                ),
                                              );
                                            }
                                          },
                                          onTapReport: () {
                                            if (isDueToday &&
                                                appointment.reported == false) {
                                              Functions.replacementTransition(
                                                context,
                                                MarketingReportScreen(
                                                    appointmentId:
                                                        appointment.sId ?? ""),
                                              );
                                            }
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: 30,
                                        child: Center(
                                          child: Container(
                                            height: 0.4,
                                            color: BLACK_LIGHT,
                                          ),
                                        ),
                                      ),
                                      itemCount:
                                          bloc.displayAppointmentList.length,
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
