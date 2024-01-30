import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:hr_management_application/view/roll_call/widgets/checkin_loading_section_view.dart';
import 'package:hr_management_application/view/roll_call/widgets/swipe_button_view.dart';

class RollCallScreen extends StatefulWidget {
  final bool isCheckedIn;
  final String appointmentId, customerName, attendanceId;
  final double referenceLat, referenceLon;

  const RollCallScreen({
    Key? key,
    required this.customerName,
    required this.isCheckedIn,
    required this.appointmentId,
    required this.referenceLat,
    required this.referenceLon,
    required this.attendanceId,
  }) : super(key: key);

  @override
  State<RollCallScreen> createState() => _RollCallScreenState();
}

class _RollCallScreenState extends State<RollCallScreen> {
  Position? positionLocated;
  bool isLoading = false;
  bool isTryAgain = false;
  String? employeeId, departmentId;

  /// direct using repo
  HRMRepoModel hrmRepoModel = HRMRepoModelImpl();
  @override
  void initState() {
    super.initState();
    isLoading = true;
    _determinePosition().then((position) {
      positionLocated = position;
      hrmRepoModel.getEmployeeData().then((employeeData) {
        employeeId = employeeData.user?.sId ?? "";
        departmentId = employeeData.user?.relatedDepartment?.sId ?? "";
        isLoading = false;
        setState(() {});
      }).onError((error, stackTrace) {
        Functions.toast(msg: "Employee Data not fetched", status: false);
        setState(() {
          isLoading = false;
        });
      });
    }).onError((e, _) {
      Functions.toast(msg: "Cannot get access location", status: false);
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var currentLocation = await Geolocator.getCurrentPosition();
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now().toString().substring(0, 10);
    var time = DateTime.now().toString().substring(11, 16);
    if (isLoading == true) {
      return Scaffold(
        body: Center(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Text(
                    "Loading...",
                    style: ConfigStyle.regularStyleOne(20, LOGIN_BUTTON_COLOR),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (isLoading == false &&
        positionLocated == null &&
        employeeId == null &&
        departmentId == null) {
      return SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Scaffold(
              backgroundColor: MATERIAL_COLOR,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: isTryAgain,
                      child: Center(
                        child: SpinKitPulse(
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: index.isEven
                                    ? APP_THEME_COLOR_REDUCE
                                    : CARD_FIRST_COLOR,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade200)),
                      onPressed: () {
                        if (isTryAgain == false) {
                          setState(() {
                            isTryAgain = true;
                          });
                          _determinePosition().then((position) {
                            positionLocated = position;
                            hrmRepoModel.getEmployeeData().then((employeeData) {
                              employeeId = employeeData.user?.sId ?? "";
                              departmentId =
                                  employeeData.user?.relatedDepartment?.sId ??
                                      "";
                              isTryAgain = false;
                              setState(() {});
                            }).onError((error, stackTrace) {
                              Functions.toast(
                                  msg: "Employee Data not fetched",
                                  status: false);
                              setState(() {
                                isTryAgain = false;
                              });
                            });
                          }).onError((e, _) {
                            Functions.toast(
                                msg: "Cannot get access location",
                                status: false);
                            setState(() {
                              isTryAgain = false;
                            });
                          });
                        }
                      },
                      child: Text(
                        (!isTryAgain) ? "Click to Reload" : "Reloading",
                        style: ConfigStyle.regularStyleOne(
                          20,
                          BLACK_LIGHT,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: MATERIAL_COLOR,
              elevation: 0.0,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: BLACK_HEAVY,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: MATERIAL_COLOR,
        body: SizedBox(
          height: scaleHeight(context),
          width: scaleWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Functions.replacementTransition(
                        context, const BottomNavigationScreen());
                  },
                  icon: const Icon(
                    Icons.close,
                    size: DIMEN_TWENTY_EIGHT,
                    color: BLACK_HEAVY,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CheckInLoadingSectionView(
                  url: (widget.isCheckedIn)
                      ? "assets/images/hr_checkin_logo.jpg"
                      : "assets/images/hr_checkout_logo.png",
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.customerName,
                      style: ConfigStyle.boldStyleThree(
                        DIMEN_TWENTY_TWO,
                        BLACK_HEAVY,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      date,
                      style: ConfigStyle.regularStyleTwo(
                        DIMEN_FOURTEEN,
                        BLACK_LIGHT,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      (widget.isCheckedIn)
                          ? "Your Check in time will be $time"
                          : "Your Check out time will be $time",
                      style: ConfigStyle.regularStyleTwo(
                        DIMEN_FOURTEEN,
                        BLACK_LIGHT,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 100,
                  width: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      Functions.buildBoxShadow(),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Latitude : ${positionLocated?.latitude ?? "Pending"}",
                          style: ConfigStyle.regularStyleOne(
                            14,
                            BLACK_LIGHT,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Longitude : ${positionLocated?.longitude ?? "Pending"}",
                          style: ConfigStyle.regularStyleOne(
                            14,
                            BLACK_LIGHT,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SwipeButtonView(
                appointmentId: widget.appointmentId,
                isCheckIn: widget.isCheckedIn,
                attendanceId: widget.attendanceId,
                referenceLat: widget.referenceLat,
                referenceLon: widget.referenceLon,
                date: date,
                time: time,
                targetLat: positionLocated?.latitude ?? 0,
                targetLon: positionLocated?.longitude ?? 0,
                employeeId: employeeId ?? "",
                departmentId: departmentId ?? "",
              ),
            ],
          ),
        ),
      );
    }
  }
}
