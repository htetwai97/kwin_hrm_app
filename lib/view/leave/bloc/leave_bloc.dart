import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/data/vo/leave_code_vo.dart';
import 'package:hr_management_application/persistence/share_preference/share_preference_key_constants.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';

class LeaveBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HRMRepoModel _hrmRepoModel = HRMRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  String? startDate;
  String? endDate;
  String? leaveType;
  File? attachFile;
  String? fileName;
  bool validate = false;
  final TextEditingController controller = TextEditingController();
  final reasonKey = GlobalKey<FormState>();
  LeaveCodeVO leaveCodeVO = LeaveCodeVO();

  LeaveBloc() {
    _showLoading();
    final formatter = DateFormat('yyyy-MM-dd');
    startDate = formatter.format(DateTime.now());
    endDate = formatter.format(DateTime.now());
    leaveType = "Casual";
    fileName = "No chosen file";
    _notifySafely();
    _hrmRepoModel.getLeaveCode().then((value) {
      leaveCodeVO = value;
      _notifySafely();
    });
    _hideLoading();
  }

  Future onTapSubmit() async {
    _showLoading();
    if (validate) {
      var formData = await _makeFormData();
      await _hrmRepoModel.postLeaveFormCreate(formData);
      Functions.toast(msg: "Leave apply successfully", status: true);
      return Future.value();
    } else {
      _hideLoading();
      Functions.toast(msg: "Fields required", status: false);
      return Future.error("error");
    }
  }

  Future<FormData> _makeFormData() async {
    var id = await _hrmRepoModel.getString(EMPLOYEE_ID);
    if (attachFile != null) {
      var formData = FormData.fromMap({
        "startDate": startDate,
        "endDate": endDate,
        "relatedUser": id,
        "reason": controller.text,
        "leaveType": leaveType,
        "status": "Unset",
        "code": leaveCodeVO.code,
        "seq": leaveCodeVO.seq,
        "attach": await MultipartFile.fromFile(
          attachFile!.path,
          filename: fileName,
          contentType: MediaType('image', 'png'),
        ),
      });
      return Future.value(formData);
    } else {
      var formData = FormData.fromMap({
        "startDate": startDate,
        "endDate": endDate,
        "relatedUser": id,
        "reason": controller.text,
        "leaveType": leaveType,
        "status": "Unset",
        "code": leaveCodeVO.code,
        "seq": leaveCodeVO.seq,
      });
      return Future.value(formData);
    }
  }

  void reasonValidate() {
    validate = (reasonKey.currentState?.validate() ?? false);
    _notifySafely();
  }

  void onPickedAttachFile(File? file) {
    attachFile = file;
    fileName = file?.path.split("/").last;
    _notifySafely();
  }

  void onChooseLeave(String leave) {
    leaveType = leave;
    _notifySafely();
  }

  void onPickStartDate(DateTime dateTime) {
    var date = dateTime;
    final formatter = DateFormat('yyyy-MM-dd');
    startDate = formatter.format(date);
    _notifySafely();
  }

  void onPickEndDate(DateTime dateTime) {
    var date = dateTime;
    final formatter = DateFormat('yyyy-MM-dd');
    endDate = formatter.format(date);
    _notifySafely();
  }

  /// loading situations
  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
