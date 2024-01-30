import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';

class MarketingReportBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HRMRepoModel _hrmRepoModel = HRMRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  String? appointmentId;
  TextEditingController contactPersonController = TextEditingController();
  final contactPersonFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  final phoneFormKey = GlobalKey<FormState>();

  /// TextEditingController businessController = TextEditingController();
  /// final businessFormKey = GlobalKey<FormState>();
  TextEditingController currentAppController = TextEditingController();
  final currentAppFormKey = GlobalKey<FormState>();
  TextEditingController currentDetailController = TextEditingController();
  final currentDetailFormKey = GlobalKey<FormState>();
  TextEditingController requirementController = TextEditingController();
  final requirementFormKey = GlobalKey<FormState>();
  TextEditingController requestController = TextEditingController();
  final requestFormKey = GlobalKey<FormState>();
  TextEditingController budgetController = TextEditingController();
  final budgetFormKey = GlobalKey<FormState>();
  TextEditingController timeController = TextEditingController();
  final timeFormKey = GlobalKey<FormState>();
  String? nextFollowupDate;
  bool contactPersonV = false;
  bool phoneV = false;
  String fileName = "Choose File";
  File? file;

  ///bool businessNameV = false;
  bool currentAppV = false;
  bool currentDetailV = false;
  bool requirementV = false;
  bool requestV = false;
  bool budgetV = false;
  bool timeV = false;
  bool isSubmitUnlock = false;

  MarketingReportBloc(String appointmentId) {
    this.appointmentId = appointmentId;
    nextFollowupDate = DateTime.now().toString().substring(0, 10);
    _notifySafely();
  }

  void onChooseFile(File file) {
    this.file = file;
    fileName = file.path.split('/').last;
    _notifySafely();
    _validate();
  }

  void contactPersonValidate() {
    contactPersonV = (contactPersonFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void phoneValidate() {
    phoneV = (phoneFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  // void businessNameValidate() {
  //   businessNameV = (businessFormKey.currentState?.validate() ?? false);
  //   _notifySafely();
  //   _validate();
  // }

  void currentAppValidate() {
    currentAppV = (currentAppFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void currentDetailValidate() {
    currentDetailV = (currentDetailFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void requirementValidate() {
    requirementV = (requirementFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void requestValidate() {
    requestV = (requestFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void budgetValidate() {
    budgetV = (budgetFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void timeValidate() {
    timeV = (timeFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void _validate() {
    if (contactPersonV &&
        phoneV &&
        nextFollowupDate != "" &&
        nextFollowupDate != null &&
        currentAppV &&
        currentDetailV &&
        requirementV &&
        requestV &&
        budgetV &&
        timeV &&
        appointmentId != null &&
        appointmentId != "" &&
        file != null) {
      isSubmitUnlock = true;
      _notifySafely();
    }
  }

  void onPickedDate(DateTime date) {
    nextFollowupDate = date.toString().substring(0, 10);
    _notifySafely();
    _validate();
  }

  Future onTapSubmit() async {
    _showLoading();
    String response = await _hrmRepoModel.reportMarketing(
      contactPersonController.text,
      phoneController.text,
      nextFollowupDate ?? "",
      currentAppController.text,
      currentDetailController.text,
      requirementController.text,
      requestController.text,
      budgetController.text,
      timeController.text,
      appointmentId ?? "",
      file ?? File(""),
    );
    if (response == "S") {
      _hideLoading();
      return Future.value("S");
    } else {
      _hideLoading();
      return Future.error("E");
    }
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
