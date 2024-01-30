import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class SwipeButtonView extends StatefulWidget {
  final bool isCheckIn;
  final String appointmentId,
      attendanceId,
      date,
      time,
      employeeId,
      departmentId;

  final double referenceLat, referenceLon, targetLat, targetLon;
  const SwipeButtonView({
    Key? key,
    required this.isCheckIn,
    required this.appointmentId,
    required this.attendanceId,
    required this.referenceLon,
    required this.referenceLat,
    required this.time,
    required this.date,
    required this.targetLat,
    required this.targetLon,
    required this.employeeId,
    required this.departmentId,
  }) : super(key: key);

  @override
  State<SwipeButtonView> createState() => _SwipeButtonViewState();
}

class _SwipeButtonViewState extends State<SwipeButtonView> {
  bool isFinished = false;
  bool isSuccess = false;

  /// direct using repo
  HRMRepoModel hrmRepoModel = HRMRepoModelImpl();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: DIMEN_TWENTY, vertical: DIMEN_TWENTY),
      child: SwipeableButtonView(
        buttonText:
            widget.isCheckIn ? "Slide to Check in" : "Slide to Check out",
        buttontextstyle: ConfigStyle.regularStyleOne(
          DIMEN_EIGHTEEN,
          MATERIAL_COLOR,
        ),
        buttonWidget: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        ),
        activeColor: (widget.isCheckIn) ? MENU_ONE_COLOR : MENU_FIVE_COLOR,
        isFinished: isFinished,
        onWaitingProcess: () {
          if (widget.isCheckIn) {
            hrmRepoModel
                .postHrmCheckIn(
              widget.employeeId,
              widget.departmentId,
              widget.time,
              widget.date,
              widget.referenceLat,
              widget.referenceLon,
              // widget.targetLat,
              // widget.targetLon,
              widget.referenceLat,
              widget.referenceLon,
            )
                .then((response) {
              if (response.data?.sId != null && response.data?.sId != "") {
                hrmRepoModel
                    .checkInAppointment(
                        widget.appointmentId, response.data?.sId ?? "")
                    .then((value) {
                  setState(() {
                    isFinished = true;
                    isSuccess = true;
                  });
                }).onError((error, stackTrace) {
                  setState(() {
                    isFinished = true;
                    isSuccess = false;
                  });
                  Functions.toast(msg: "CRM Dio failed", status: false);
                });
              } else {
                setState(() {
                  isFinished = true;
                  isSuccess = false;
                });
                Functions.toast(msg: "Location not correct", status: false);
              }
            }).onError((error, stackTrace) {
              setState(() {
                isFinished = true;
                isSuccess = false;
              });
              Functions.toast(msg: "HRM Dio failed", status: false);
            });
          } else {
            hrmRepoModel
                .postHrmCheckOut(
              widget.time,
              widget.attendanceId,
              widget.referenceLat,
              widget.referenceLon,
              // widget.targetLat,
              // widget.targetLon,
              widget.referenceLat,
              widget.referenceLon,
            )
                .then((value) {
              if (value.success == true) {
                hrmRepoModel
                    .checkOutAppointment(widget.appointmentId)
                    .then((value) {
                  setState(() {
                    isFinished = true;
                    isSuccess = true;
                  });
                }).onError((error, stackTrace) {
                  setState(() {
                    isFinished = true;
                    isSuccess = false;
                  });
                  Functions.toast(msg: "CRM Dio failed", status: false);
                });
              } else {
                setState(() {
                  isFinished = true;
                  isSuccess = false;
                });
                Functions.toast(msg: "Location not correct", status: false);
              }
            }).onError((error, stackTrace) {
              setState(() {
                isFinished = true;
                isSuccess = false;
              });
              Functions.toast(msg: "HRM Dio failed", status: false);
            });
          }
        },
        onFinish: () async {
          setState(() {
            isFinished = false;
          });
          if (isSuccess) {
            Functions.toast(
                msg:
                    (widget.isCheckIn) ? "Checkin Success" : "Checkout Success",
                status: true);
            Functions.replacementTransition(
                context, const BottomNavigationScreen());
          } else {
            Functions.toast(
                msg: (widget.isCheckIn) ? "Checkin failed" : "Checkout failed",
                status: false);
          }
        },
      ),
    );
  }
}
