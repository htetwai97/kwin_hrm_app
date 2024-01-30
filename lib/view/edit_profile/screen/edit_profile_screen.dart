import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/vo/user_data_vo.dart';
import 'package:hr_management_application/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:hr_management_application/view/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:hr_management_application/view/edit_profile/widgets/common_text_field_without_border.dart';
import 'package:hr_management_application/view/edit_profile/widgets/email_text_field_without_border.dart';
import 'package:hr_management_application/view/edit_profile/widgets/file_upload_section_view.dart';
import 'package:hr_management_application/view/edit_profile/widgets/gender_choose_view.dart';
import 'package:hr_management_application/view/edit_profile/widgets/phone_text_field_without_border.dart';
import 'package:hr_management_application/view/profile/widgets/profile_pic_and_name_row_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  final UserDataVO? userDataVO;
  const EditProfileScreen({
    Key? key,
    required this.userDataVO,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: ChangeNotifierProvider(
        create: (context) => EditProfileBloc(userDataVO),
        child: ScaffoldWithConnectionStatus(
          child: Scaffold(
            backgroundColor: MATERIAL_COLOR,
            appBar: AppBar(
              backgroundColor: MATERIAL_COLOR,
              elevation: 0.0,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: BLACK_HEAVY,
                ),
              ),
              title: Text(
                "Edit Profile",
                style: ConfigStyle.boldStyleThree(
                  DIMEN_EIGHTEEN,
                  BLACK_HEAVY,
                ),
              ),
            ),
            body: Selector<EditProfileBloc, bool>(
              selector: (context, bloc) => bloc.isLoading,
              builder: (context, isLoading, child) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) =>
                                ProfilePicNamePositionView(
                              name: "You",
                              position: "",
                              profilePic: bloc.profileFromNetwork,
                              file: bloc.profileImageFile,
                              isEdit: true,
                              onTapEdit: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.image,
                                  allowMultiple: false,
                                );
                                var platFormFile = result?.files.first;
                                if (platFormFile != null) {
                                  bloc.onChooseProfilePic(
                                    File(platFormFile.path ?? ""),
                                  );
                                }
                              },
                            ),
                          ),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.userNameFormKey,
                              child: CommonTextFieldWithoutBorder(
                                commonController: bloc.userNameController,
                                onChanged: () {
                                  bloc.validate();
                                },
                                title: "User Name",
                                hint: "Enter User Name",
                                validationText: "Please enter User Name",
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) => GenderChooseView(
                              groupValue: bloc.groupValueForGender,
                              onChooseRadio: (value) {
                                bloc.onChooseGender(value);
                                bloc.validate();
                              },
                            ),
                          ),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.phoneFormKey,
                              child: PhoneTextFieldWithoutBorder(
                                title: "Phone",
                                hint: "Enter Phone Number",
                                validationText: "Please Enter Phone No",
                                phoneController: bloc.phoneController,
                                onChanged: () {
                                  bloc.validate();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.emailFormKey,
                              child: EmailTextFieldWithoutBorder(
                                onChanged: () {
                                  bloc.validate();
                                },
                                emailController: bloc.emailController,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.addressFormKey,
                              child: CommonTextFieldWithoutBorder(
                                commonController: bloc.addressController,
                                onChanged: () {
                                  bloc.validate();
                                },
                                title: "Address",
                                hint: "Enter Address",
                                validationText: "Please enter an address",
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.emergencyFormKey,
                              child: PhoneTextFieldWithoutBorder(
                                title: "Emergency Contact",
                                hint: "Enter Emergency Contact",
                                validationText:
                                    "Please Enter Emergency Contact",
                                phoneController:
                                    bloc.emergencyContactController,
                                onChanged: () {
                                  bloc.validate();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.educationFormKey,
                              child: CommonTextFieldWithoutBorder(
                                commonController: bloc.educationController,
                                onChanged: () {
                                  bloc.validate();
                                },
                                title: "Education",
                                hint: "Enter Education status",
                                validationText: "Please enter education status",
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.workExperienceFormKey,
                              child: CommonTextFieldWithoutBorder(
                                commonController: bloc.workExperienceController,
                                onChanged: () {
                                  bloc.validate();
                                },
                                title: "Work Experience",
                                hint: "Enter Work Experience",
                                validationText: "Please enter Work Experience",
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) =>
                                FileUploadSectionView(
                              title: "CV form (file)",
                              fileName: bloc.cvFileName,
                              iconData: MdiIcons.file,
                              onTapFile: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.any,
                                  allowMultiple: false,
                                );
                                var platFormFile = result?.files.first;
                                if (platFormFile != null) {
                                  bloc.onChooseCV(
                                    File(platFormFile.path ?? ""),
                                  );
                                }
                              },
                              onTapRemoveFile: () {
                                bloc.onRemoveCV();
                              },
                            ),
                          ),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) =>
                                FileUploadSectionView(
                              title: "Certificate (file)",
                              fileName: bloc.certificateFileName,
                              iconData: MdiIcons.file,
                              onTapFile: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.any,
                                  allowMultiple: false,
                                );
                                var platFormFile = result?.files.first;
                                if (platFormFile != null) {
                                  bloc.onChooseCertificate(
                                    File(platFormFile.path ?? ""),
                                  );
                                }
                              },
                              onTapRemoveFile: () {
                                bloc.onRemoveCertificate();
                              },
                            ),
                          ),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) =>
                                FileUploadSectionView(
                              title: "Recommendation Letter (file)",
                              fileName: bloc.recommendationFileName,
                              iconData: MdiIcons.file,
                              onTapFile: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.any,
                                  allowMultiple: false,
                                );
                                var platFormFile = result?.files.first;
                                if (platFormFile != null) {
                                  bloc.onChooseRecommendationLetter(
                                    File(platFormFile.path ?? ""),
                                  );
                                }
                              },
                              onTapRemoveFile: () {
                                bloc.onRemoveRecommendation();
                              },
                            ),
                          ),
                          Consumer<EditProfileBloc>(
                            builder: (context, bloc, child) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: DIMEN_SIXTEEN),
                              child: MaterialButton(
                                onPressed: () {
                                  if (bloc.isEditUnlock) {
                                    bloc.onTapEdit().then((value) {
                                      Functions.replacementTransition(context,
                                          const BottomNavigationScreen());
                                    });
                                  }
                                },
                                minWidth: double.infinity,
                                height: 50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: bloc.isEditUnlock
                                    ? LOGIN_BUTTON_COLOR
                                    : Colors.grey,
                                child: Text(
                                  "Edit",
                                  style: ConfigStyle.boldStyleTwo(
                                      DIMEN_EIGHTEEN, MATERIAL_COLOR),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Visibility(
                        visible: isLoading,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
