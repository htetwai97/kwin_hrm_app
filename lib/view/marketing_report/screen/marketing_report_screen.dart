import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:hr_management_application/view/leave/widgets/date_pick_section_row_view.dart';
import 'package:hr_management_application/view/leave/widgets/description_text_field_view.dart';
import 'package:hr_management_application/view/marketing_report/bloc/marketing_report_bloc.dart';
import 'package:hr_management_application/view/marketing_report/widget/market_report_file_pick_view.dart';
import 'package:hr_management_application/view/onboarding/widgets/button_elevated_view.dart';
import 'package:provider/provider.dart';

class MarketingReportScreen extends StatelessWidget {
  final String appointmentId;
  const MarketingReportScreen({
    Key? key,
    required this.appointmentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => MarketingReportBloc(appointmentId),
        child: Scaffold(
          backgroundColor: APP_THEME_COLOR,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Functions.replacementTransition(
                            context, const BottomNavigationScreen());
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
                        "Marketing report",
                        style: ConfigStyle.regularStyleThree(
                          DIMEN_TWENTY_TWO,
                          MATERIAL_COLOR,
                        ),
                      ),
                    ),
                    SizedBox(height: scaleHeight(context) / 30),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: DIMEN_SIXTEEN, vertical: 10),
                      width: scaleWidth(context),
                      decoration: BoxDecoration(
                        color: MATERIAL_COLOR,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
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
                            "Apply the customer related marketing report",
                            style: ConfigStyle.regularStyleThree(
                              DIMEN_FOURTEEN,
                              LEAVE_SCREEN_COLOR,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.contactPersonFormKey,
                              child: DescriptionTextFieldView(
                                title: "Contact person",
                                hint: "Enter contact person",
                                maxLine: 1,
                                descriptionController:
                                    bloc.contactPersonController,
                                onChanged: () {
                                  bloc.contactPersonValidate();
                                },
                              ),
                            ),
                          ),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.phoneFormKey,
                              child: DescriptionTextFieldView(
                                title: "Phone",
                                hint: "Enter phone",
                                maxLine: 1,
                                descriptionController: bloc.phoneController,
                                onChanged: () {
                                  bloc.phoneValidate();
                                },
                              ),
                            ),
                          ),
                          // Consumer<MarketingReportBloc>(
                          //   builder: (context, bloc, child) => Form(
                          //     key: bloc.businessFormKey,
                          //     child: DescriptionTextFieldView(
                          //       title: "Business Name",
                          //       hint: "Enter business name",
                          //       maxLine: 1,
                          //       descriptionController:
                          //           bloc.businessController,
                          //       onChanged: () {
                          //         bloc.businessNameValidate();
                          //       },
                          //     ),
                          //   ),
                          // ),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.currentAppFormKey,
                              child: DescriptionTextFieldView(
                                title: "Current App",
                                hint: "Enter current app",
                                maxLine: 1,
                                descriptionController:
                                    bloc.currentAppController,
                                onChanged: () {
                                  bloc.currentAppValidate();
                                },
                              ),
                            ),
                          ),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.currentDetailFormKey,
                              child: DescriptionTextFieldView(
                                title: "Current Detail",
                                hint: "Enter current detail",
                                maxLine: 6,
                                descriptionController:
                                    bloc.currentDetailController,
                                onChanged: () {
                                  bloc.currentDetailValidate();
                                },
                              ),
                            ),
                          ),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.requirementFormKey,
                              child: DescriptionTextFieldView(
                                title: "Requirements",
                                hint: "Enter requirements",
                                maxLine: 6,
                                descriptionController:
                                    bloc.requirementController,
                                onChanged: () {
                                  bloc.requirementValidate();
                                },
                              ),
                            ),
                          ),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.requestFormKey,
                              child: DescriptionTextFieldView(
                                title: "Request",
                                hint: "Enter request",
                                maxLine: 6,
                                descriptionController: bloc.requestController,
                                onChanged: () {
                                  bloc.requestValidate();
                                },
                              ),
                            ),
                          ),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.budgetFormKey,
                              child: DescriptionTextFieldView(
                                title: "Budget",
                                hint: "Enter expected budget",
                                maxLine: 1,
                                descriptionController: bloc.budgetController,
                                onChanged: () {
                                  bloc.budgetValidate();
                                },
                              ),
                            ),
                          ),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) => Form(
                              key: bloc.timeFormKey,
                              child: DescriptionTextFieldView(
                                title: "Time",
                                hint: "Enter estimated time",
                                maxLine: 1,
                                descriptionController: bloc.timeController,
                                onChanged: () {
                                  bloc.timeValidate();
                                },
                              ),
                            ),
                          ),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) =>
                                DatePickSectionRowView(
                              title: "Next follow-up date",
                              selectedDate: bloc.nextFollowupDate ??
                                  DateTime.now().toString().substring(0, 10),
                              onPickDate: (date) {
                                bloc.onPickedDate(date);
                              },
                            ),
                          ),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) =>
                                MarketReportFilePickView(
                              title: "Attach File",
                              fileName: bloc.fileName,
                              onPickFile: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.any,
                                  allowMultiple: false,
                                );
                                var platFormFile = result?.files.first;
                                if (platFormFile != null) {
                                  bloc.onChooseFile(
                                    File(platFormFile.path ?? ""),
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: DIMEN_TWENTY),
                          Consumer<MarketingReportBloc>(
                            builder: (context, bloc, child) =>
                                ButtonElevatedView(
                              title: "Submit",
                              onTap: () {
                                if (bloc.isSubmitUnlock) {
                                  bloc.onTapSubmit().then((value) {
                                    Functions.replacementTransition(context,
                                        const BottomNavigationScreen());
                                  });
                                } else {
                                  Functions.toast(
                                      msg: "Fields required", status: false);
                                }
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
              Selector<MarketingReportBloc, bool>(
                selector: (context, bloc) => bloc.isLoading,
                builder: (context, isLoading, child) => Visibility(
                    visible: isLoading,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
