import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_config/config_strings.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/network/api_service/api_constants.dart';
import 'package:hr_management_application/view/edit_profile/screen/edit_profile_screen.dart';
import 'package:hr_management_application/view/profile/bloc/profile_bloc.dart';
import 'package:hr_management_application/view/profile/widgets/back_and_edit_button_row_view.dart';
import 'package:hr_management_application/view/profile/widgets/profile_icon_and_text_row_view_one.dart';
import 'package:hr_management_application/view/profile/widgets/profile_icon_and_text_row_view_two.dart';
import 'package:hr_management_application/view/profile/widgets/profile_image_full_view.dart';
import 'package:hr_management_application/view/profile/widgets/profile_pic_and_name_row_view.dart';
import 'package:hr_management_application/view/profile/widgets/status_and_department_boxes_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: ChangeNotifierProvider(
        create: (context) => ProfileBloc(),
        child: ScaffoldWithConnectionStatus(
          child: SafeArea(
            child: Scaffold(
              body: Consumer<ProfileBloc>(builder: (context, bloc, child) {
                if (bloc.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BackAndEditButtonRowView(
                          onTapBack: () {
                            Navigator.pop(context);
                          },
                          onTapEdit: () {
                            var userData = bloc.userDataVO;
                            Functions.transition(
                              context,
                              EditProfileScreen(
                                userDataVO: userData,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfilePicNamePositionView(
                                profilePic: (bloc.userDataVO?.profilePic !=
                                            null &&
                                        bloc.userDataVO?.profilePic?.length !=
                                            0)
                                    ? "$IMAGE_BASE_URL${bloc.userDataVO?.profilePic?.last.imgUrl ?? PROFILE_PLACE_HOLDER}"
                                    : PROFILE_PLACE_HOLDER,
                                position:
                                    bloc.userDataVO?.relatedPosition?.name ??
                                        "",
                                name: bloc.userDataVO?.givenName ?? "",
                                onTapEdit: () {
                                  Functions.bottomTopUp(
                                    context,
                                    ProfileImageFullView(
                                      url: (bloc.userDataVO?.profilePic !=
                                                  null &&
                                              bloc.userDataVO?.profilePic
                                                      ?.length !=
                                                  0)
                                          ? "$IMAGE_BASE_URL${bloc.userDataVO?.profilePic?.last.imgUrl ?? PROFILE_PLACE_HOLDER}"
                                          : PROFILE_PLACE_HOLDER,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 40),
                              ProfileIconAndTextRowViewOne(
                                name: bloc.userDataVO?.phone ?? "",
                                iconData: Icons.phone,
                              ),
                              const SizedBox(height: 20),
                              ProfileIconAndTextRowViewOne(
                                name: bloc.userDataVO?.email ?? "",
                                iconData: Icons.email_outlined,
                              ),
                              const SizedBox(height: 20),
                              ProfileIconAndTextRowViewOne(
                                name: bloc.userDataVO?.address ?? "",
                                iconData: Icons.home_outlined,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        StatusAndDepartmentBoxesView(
                          titleOne: "Department",
                          valueOne:
                              bloc.userDataVO?.relatedDepartment?.name ?? "",
                          titleTwo: "Start Date",
                          valueTwo:
                              bloc.userDataVO?.startDate?.substring(0, 10) ??
                                  "",
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileIconAndTextRowViewTwo(
                                title: "Emergency Contact",
                                value: bloc.userDataVO?.emergencyContact ?? "",
                                iconData: MdiIcons.phoneAlert,
                                onTapLink: () {
                                  /// no need to invoke
                                },
                              ),
                              ProfileIconAndTextRowViewTwo(
                                title: "Work experience",
                                value: bloc.userDataVO?.workExperience ?? "",
                                iconData: MdiIcons.facebookWorkplace,
                                onTapLink: () {
                                  /// no need to invoke
                                },
                              ),
                              ProfileIconAndTextRowViewTwo(
                                title: "Basic Salary",
                                value: bloc.userDataVO?.relatedPosition
                                        ?.basicSalary
                                        ?.toString() ??
                                    "",
                                iconData: MdiIcons.cash,
                                onTapLink: () {
                                  /// no need to invoke
                                },
                              ),
                              ProfileIconAndTextRowViewTwo(
                                title: "Education",
                                value:
                                    bloc.userDataVO?.educationBackground ?? "",
                                iconData: MdiIcons.schoolOutline,
                                onTapLink: () {
                                  /// no need to invoke
                                },
                              ),
                              ProfileIconAndTextRowViewTwo(
                                isUnderline: true,
                                title: "CV Form",
                                value: "See CV form detail..",
                                iconData: MdiIcons.applicationImport,
                                onTapLink: () {
                                  var user = bloc.userDataVO;
                                  if (user?.cV != null &&
                                      user?.cV?.length != 0) {
                                    bloc.onTapLink(
                                        "$IMAGE_BASE_URL${bloc.userDataVO?.cV?.last.imgUrl ?? ""}");
                                  } else {
                                    Functions.toast(
                                        msg: "There's no uploaded file yet",
                                        status: false);
                                  }
                                },
                              ),
                              ProfileIconAndTextRowViewTwo(
                                isUnderline: true,
                                title: "Education Certificate",
                                value: "See Education Certificate detail..",
                                iconData: MdiIcons.bookEducation,
                                onTapLink: () {
                                  var user = bloc.userDataVO;
                                  if (user?.educationCertificate != null &&
                                      user?.educationCertificate?.length != 0) {
                                    bloc.onTapLink(
                                        "$IMAGE_BASE_URL${bloc.userDataVO?.educationCertificate?.last.imgUrl ?? ""}");
                                  } else {
                                    Functions.toast(
                                        msg: "There's no uploaded file yet",
                                        status: false);
                                  }
                                },
                              ),
                              ProfileIconAndTextRowViewTwo(
                                isUnderline: true,
                                title: "Recommendation Letter",
                                value: "See Recommendation Letter detail..",
                                iconData: MdiIcons.emailNewsletter,
                                onTapLink: () {
                                  var user = bloc.userDataVO;
                                  if (user?.recommendationLetter != null &&
                                      user?.recommendationLetter?.length != 0) {
                                    bloc.onTapLink(
                                        "$IMAGE_BASE_URL${bloc.userDataVO?.recommendationLetter?.last.imgUrl ?? ""}");
                                  } else {
                                    Functions.toast(
                                        msg: "There's no uploaded file yet",
                                        status: false);
                                  }
                                },
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
