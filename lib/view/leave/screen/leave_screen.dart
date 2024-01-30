import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:hr_management_application/view/leave/bloc/leave_bloc.dart';
import 'package:hr_management_application/view/leave/widgets/attach_file_section_view.dart';
import 'package:hr_management_application/view/leave/widgets/date_pick_section_row_view.dart';
import 'package:hr_management_application/view/leave/widgets/description_text_field_view.dart';
import 'package:hr_management_application/view/leave/widgets/drop_down_section_view.dart';
import 'package:hr_management_application/view/onboarding/widgets/button_elevated_view.dart';
import 'package:provider/provider.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: ChangeNotifierProvider(
        create: (context) => LeaveBloc(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: APP_THEME_COLOR,
            body: Selector<LeaveBloc, bool>(
                builder: (context, isLoading, child) {
                  return Stack(
                    children: [
                      SingleChildScrollView(
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
                                "Apply Leave",
                                style: ConfigStyle.regularStyleThree(
                                  DIMEN_TWENTY_TWO,
                                  MATERIAL_COLOR,
                                ),
                              ),
                            ),
                            SizedBox(height: scaleHeight(context) / 30),
                            Container(
                              width: scaleWidth(context),
                              decoration: BoxDecoration(
                                color: (!isLoading)
                                    ? MATERIAL_COLOR
                                    : Colors.black26,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(24),
                                  topLeft: Radius.circular(24),
                                ),
                                boxShadow: [
                                  Functions.buildBoxShadow(),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 30),
                                  Text(
                                    "Fill your Leave permission form data",
                                    style: ConfigStyle.regularStyleThree(
                                      DIMEN_FOURTEEN,
                                      LEAVE_SCREEN_COLOR,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Consumer<LeaveBloc>(
                                    builder: (context, bloc, child) =>
                                        DatePickSectionRowView(
                                      title: "Date(From)",
                                      selectedDate:
                                          bloc.startDate ?? "Start date",
                                      onPickDate: (date) {
                                        bloc.onPickStartDate(date);
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Consumer<LeaveBloc>(
                                    builder: (context, bloc, child) =>
                                        DatePickSectionRowView(
                                      title: "Date(To)",
                                      selectedDate: bloc.endDate ?? "End date",
                                      onPickDate: (date) {
                                        bloc.onPickEndDate(date);
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Consumer<LeaveBloc>(
                                    builder: (context, bloc, child) => Form(
                                      key: bloc.reasonKey,
                                      child: DescriptionTextFieldView(
                                        maxLine: 4,
                                        descriptionController: bloc.controller,
                                        onChanged: () {
                                          bloc.reasonValidate();
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Consumer<LeaveBloc>(
                                    builder: (context, bloc, child) =>
                                        DropDownSectionView(
                                      list: const [
                                        'Casual',
                                        'Medical',
                                        'Vacation',
                                        'Maternity:Male',
                                        'Maternity:Female'
                                      ],
                                      menuTitle: "Choose leave type",
                                      selectedValue: bloc.leaveType ?? "Casual",
                                      onChoose: (value) {
                                        bloc.onChooseLeave(value);
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Consumer<LeaveBloc>(
                                    builder: (context, bloc, child) =>
                                        AttachFileSectionView(
                                      fileName: bloc.fileName ?? "",
                                      onChooseFile: () async {
                                        var result =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.image,
                                          allowMultiple: false,
                                        );
                                        var platFormFile = result?.files.first;
                                        if (platFormFile != null) {
                                          bloc.onPickedAttachFile(
                                            File(platFormFile.path ?? ""),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Consumer<LeaveBloc>(
                                    builder: (context, bloc, child) =>
                                        ButtonElevatedView(
                                      color: bloc.validate
                                          ? APP_THEME_COLOR
                                          : Colors.grey.shade600,
                                      title: "Submit",
                                      onTap: () {
                                        bloc.onTapSubmit().then((value) {
                                          Functions.replacementTransition(
                                              context,
                                              const BottomNavigationScreen());
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isLoading,
                        child: const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            color: Colors.amber,
                          ),
                        ),
                      )
                    ],
                  );
                },
                selector: (context, bloc) => bloc.isLoading),
          ),
        ),
      ),
    );
  }
}
