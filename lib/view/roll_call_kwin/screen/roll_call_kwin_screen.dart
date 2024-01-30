import 'package:hr_management_application/connection_test_service/scaffold_with_connection_status.dart';
import 'package:hr_management_application/core/core_config/config_color.dart';
import 'package:hr_management_application/core/core_config/config_dimension.dart';
import 'package:hr_management_application/core/core_config/config_strings.dart';
import 'package:hr_management_application/core/core_config/config_style.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/data/vo/pdf_document_vo.dart';
import 'package:hr_management_application/data/vo/user_data_vo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hr_management_application/network/api_service/api_constants.dart';
import 'package:hr_management_application/persistence/share_preference/share_preference_key_constants.dart';
import 'package:hr_management_application/view/assignment/widgets/category_box_detail_view.dart';
import 'package:hr_management_application/view/assignment/widgets/greeting_view.dart';
import 'package:hr_management_application/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:hr_management_application/view/roll_call_kwin/widgets/icon_and_two_column_text_row_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RollCallKWinScreen extends StatefulWidget {
  final UserDataVO? userDataVO;
  const RollCallKWinScreen({
    Key? key,
    required this.userDataVO,
  }) : super(key: key);

  @override
  State<RollCallKWinScreen> createState() => _RollCallMedicalScreenState();
}

class _RollCallMedicalScreenState extends State<RollCallKWinScreen> {
  PDFDocumentVO? profile;
  UserDataVO? userDataVO;
  Position? positionLocated;
  bool isLoading = false;
  bool isTryAgain = false;
  bool isCheckedIn = false;
  bool isTodayComplete = false;
  bool isAttendanceLoading = false;
  final HRMRepoModel hrmRepoModel = HRMRepoModelImpl();
  String checkInTime = "No check in yet";
  String checkOutTime = "No check out yet";
  String attendanceId = "normal";
  double refLat = 0;
  double refLon = 0;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _prepopulate().then((value) {
      positionLocated = Position(
        longitude: -73.987427,
        latitude: 40.748817,
        timestamp: DateTime.now(),
        accuracy: 10.0,
        altitude: 0.0,
        altitudeAccuracy: 5.0,
        heading: 90.0,
        headingAccuracy: 2.0,
        speed: 5.0,
        speedAccuracy: 1.5,
        floor: 1,
        isMocked: false,
      );
      hrmRepoModel.getLocation().then((response) {
        if (response.data != null && response.data?.length != 0) {
          refLat = response.data?[0].referenceLat ?? 0;
          refLon = response.data?[0].referenceLon ?? 0;
        }
        isLoading = false;
        setState(() {});
      }).onError((error, stackTrace) {
        debugPrint("Error ==> $error\nStackTrace ==> $stackTrace");
        isLoading = false;
        setState(() {});
      });
    });
  }

  Future<void> _prepopulate() async {
    attendanceId = await hrmRepoModel.getString(ATTENDANCE_ID);
    await _resetAttendance();
    userDataVO = widget.userDataVO;
    if (userDataVO?.profilePic != null && userDataVO?.profilePic?.length != 0) {
      profile = userDataVO?.profilePic?.last;
    } else {
      Functions.toast(msg: "Profile Picture not available", status: false);
    }
    return Future.value();
  }

  Future<void> _checkInHrm() async {
    positionLocated = null;
    await _determinePosition().then((position) {
      positionLocated = position;
    }).onError((e, _) {
      Functions.toast(msg: "Location access error", status: false);
    });
    var date = DateTime.now().toString().substring(0, 10);
    var time = DateTime.now().toString().substring(11, 16);
    await hrmRepoModel
        .postHrmCheckIn(
      userDataVO?.sId ?? "",
      userDataVO?.relatedDepartment?.sId ?? "",
      time,
      date,
      refLat,
      refLon,
      positionLocated?.latitude ?? 0,
      positionLocated?.longitude ?? 0,
    )
        .then((response) async {
      if (response.success == true) {
        attendanceId = response.data?.sId ?? "";
        await hrmRepoModel.saveString(ATTENDANCE_ID, attendanceId);
        await hrmRepoModel.saveString(
            CHECKIN_DATETIME, DateTime.now().toString());
        await _resetAttendance();
        Functions.toast(msg: "Check In Success", status: true);
        isAttendanceLoading = false;
        setState(() {});
      } else {
        Functions.toast(
            msg:
                "သင်သည်သတ်မှတ်ထားသောနေရာသို့မရောက်သေးပါသဖြင့် check in လုပ်၍မရပါ",
            status: false);
        isAttendanceLoading = false;
        setState(() {});
      }
    }).onError((error, stackTrace) {
      Functions.toast(msg: "HRM Check in failed", status: false);
      isAttendanceLoading = false;
      setState(() {});
    });
  }

  Future<void> _checkOutHrm() async {
    positionLocated = null;
    await _determinePosition().then((position) {
      positionLocated = position;
    }).onError((e, _) {
      Functions.toast(msg: "Location access error", status: false);
    });
    var time = DateTime.now().toString().substring(11, 16);
    await hrmRepoModel
        .postHrmCheckOut(
      time,
      attendanceId,
      refLat,
      refLon,
      positionLocated?.latitude ?? 0,
      positionLocated?.longitude ?? 0,
    )
        .then((response) async {
      if (response.success == true) {
        await hrmRepoModel.saveString(
            CHECKOUT_DATETIME, DateTime.now().toString());
        await _resetAttendance();
        Functions.toast(msg: "Check Out success", status: true);
        isAttendanceLoading = false;
        setState(() {});
      } else {
        Functions.toast(
            msg:
                "သင်သည်သတ်မှတ်ထားသောနေရာသို့မရောက်သေးပါသဖြင့် check out လုပ်၍မရပါ",
            status: false);
        isAttendanceLoading = false;
        setState(() {});
      }
    }).onError((error, stackTrace) {
      Functions.toast(msg: "HRM Check Out failed", status: false);
      isAttendanceLoading = false;
      setState(() {});
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
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var currentLocation = await Geolocator.getCurrentPosition(
        // forceAndroidLocationManager: true,
        // desiredAccuracy: LocationAccuracy.best,
        );
    return currentLocation;
  }

  Future _onTapOKCheckIn() async {
    await _checkInHrm();
  }

  Future _onTapOKCheckOut() async {
    await _checkOutHrm();
  }

  Future<void> _resetAttendance() async {
    var checkedInDate = await hrmRepoModel.getString(CHECKIN_DATETIME);
    var checkedOutDate = await hrmRepoModel.getString(CHECKOUT_DATETIME);
    var today = DateTime.now().toString();
    if (checkedInDate == "") {
      checkedInDate = "11111111111111111111111";
    }
    if (checkedOutDate == "") {
      checkedOutDate = "11111111111111111111111";
    }
    if (checkedInDate.substring(0, 10) == today.substring(0, 10) &&
        checkedOutDate.substring(0, 10) == today.substring(0, 10)) {
      isTodayComplete = true;
      checkInTime = checkedInDate.substring(11, 16);
      checkOutTime = checkedOutDate.substring(11, 16);
      isCheckedIn = false;
    } else {
      isTodayComplete = false;
      if (checkedInDate.substring(0, 10) == today.substring(0, 10) &&
          checkedOutDate.substring(0, 10) != today.substring(0, 10)) {
        checkInTime = checkedInDate.substring(11, 16);
        isCheckedIn = true;
      } else if (checkedInDate.substring(0, 10) != today.substring(0, 10) &&
          checkedOutDate.substring(0, 10) != today.substring(0, 10)) {
        isCheckedIn = false;
      }
    }
  }

  void _onTapCheckInOrCheckOut(BuildContext context) {
    Functions.logoutDialog(context, 100, () {
      Navigator.pop(context);
    }, () {
      isAttendanceLoading = true;
      setState(() {});
      if (!isTodayComplete) {
        if (isCheckedIn) {
          _onTapOKCheckOut();
        } else {
          _onTapOKCheckIn();
        }
      } else {
        isAttendanceLoading = false;
        setState(() {});
        Functions.toast(msg: "Attendance completes today");
      }
      Navigator.pop(context);
    }, "Are you Sure?", "Your attendance will be recorded.", "Cancel", "OK");
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return ScaffoldWithConnectionStatus(
        child: Scaffold(
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
                      style:
                          ConfigStyle.regularStyleOne(20, LOGIN_BUTTON_COLOR),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else if (isLoading == false &&
        isAttendanceLoading == false &&
        positionLocated == null) {
      return SafeArea(
        child: ScaffoldWithConnectionStatus(
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
                            backgroundColor: MaterialStateProperty.all(
                                Colors.grey.shade200)),
                        onPressed: () async {
                          if (isTryAgain == false) {
                            setState(() {
                              isTryAgain = true;
                            });
                            _determinePosition().then((position) async {
                              positionLocated = position;
                              await _prepopulate();
                              setState(() {
                                isTryAgain = false;
                              });
                            }).onError((e, _) {
                              Functions.toast(
                                  msg: "Location access error", status: false);
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
                    Functions.replacementTransition(
                      context,
                      const BottomNavigationScreen(
                        currentIndex: 1,
                      ),
                    );
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
        ),
      );
    } else {
      return ScaffoldWithConnectionStatus(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: isAttendanceLoading == false,
              child: Container(
                color: MATERIAL_COLOR,
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: MATERIAL_COLOR,
                    appBar: AppBar(
                      backgroundColor: MATERIAL_COLOR,
                      elevation: 0.0,
                      leadingWidth: 70,
                      leading: IconButton(
                        onPressed: () {
                          Functions.replacementTransition(
                            context,
                            const BottomNavigationScreen(
                              currentIndex: 1,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: BLACK_HEAVY,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 16, bottom: 2, top: 2),
                          child: InkWell(
                            radius: 100,
                            highlightColor: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(45),
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  "$IMAGE_BASE_URL${profile?.imgUrl ?? PROFILE_PLACE_HOLDER}"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            GreetingView(
                              name: userDataVO?.givenName ?? "",
                              color: BLACK_HEAVY,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Today Activities",
                              style: ConfigStyle.boldStyleThree(
                                20,
                                BLACK_HEAVY,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryBoxDetailView(
                                  width: 150,
                                  height: 140,
                                  verticalMargin: 10,
                                  colorOne: CATEGORY_TWO_COLOR_ONE,
                                  colorTwo: CATEGORY_TWO_COLOR_TWO,
                                  iconData: MdiIcons.clockIn,
                                  name: "Check In",
                                  taskQuantity: checkInTime,
                                  onTap: () {},
                                ),
                                CategoryBoxDetailView(
                                  width: 150,
                                  height: 140,
                                  verticalMargin: 10,
                                  colorOne: CATEGORY_ONE_COLOR_ONE,
                                  colorTwo: CATEGORY_ONE_COLOR_TWO,
                                  iconData: MdiIcons.clockOut,
                                  name: "Check Out",
                                  taskQuantity: checkOutTime,
                                  onTap: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: Container(
                                  color: BLACK_LIGHT,
                                  height: 0.4,
                                ),
                              ),
                            ),
                            Text(
                              "Date and Time",
                              style: ConfigStyle.boldStyleThree(
                                16,
                                BLACK_HEAVY,
                              ),
                            ),
                            const SizedBox(height: 30),
                            IconAndTwoColumnTextRowView(
                              width: 200,
                              image: "assets/images/medical_world_checkin.png",
                              textOne: (!isCheckedIn)
                                  ? "Your Check In time will be ${DateTime.now().toString().substring(11, 16)}"
                                  : "Your Check Out time will be ${DateTime.now().toString().substring(11, 16)}",
                              textTwo:
                                  DateTime.now().toString().substring(0, 10),
                            ),
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: Container(
                                  color: BLACK_LIGHT,
                                  height: 0.4,
                                ),
                              ),
                            ),
                            Text(
                              "Location",
                              style: ConfigStyle.boldStyleThree(
                                16,
                                BLACK_HEAVY,
                              ),
                            ),
                            const SizedBox(height: 30),
                            IconAndTwoColumnTextRowView(
                              visible: true,
                              image: "assets/images/hr_checkin_logo.jpg",
                              textOne: positionLocated?.latitude.toString() ??
                                  "16.8533798",
                              textTwo: positionLocated?.longitude.toString() ??
                                  "96.1265779",
                            ),
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: Container(
                                  color: BLACK_LIGHT,
                                  height: 0.4,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: DIMEN_SIXTEEN),
                              child: MaterialButton(
                                onPressed: () {
                                  if (isAttendanceLoading == false) {
                                    _onTapCheckInOrCheckOut(context);
                                  }
                                },
                                minWidth: double.infinity,
                                height: 50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: (!isTodayComplete)
                                    ? (isCheckedIn)
                                        ? CATEGORY_ONE_COLOR_ONE
                                        : CATEGORY_TWO_COLOR_ONE
                                    : Colors.grey.shade500,
                                child: Text(
                                  (isCheckedIn) ? "Check Out" : "Check In",
                                  style: ConfigStyle.boldStyleTwo(
                                      DIMEN_EIGHTEEN, MATERIAL_COLOR),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isAttendanceLoading == true,
              child: Container(
                color: MATERIAL_COLOR,
              ),
            ),
            Visibility(
              visible: isAttendanceLoading == true,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      );
    }
  }
}
