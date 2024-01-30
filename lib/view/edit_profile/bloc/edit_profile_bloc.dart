import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hr_management_application/core/core_config/config_strings.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/data/vo/user_data_vo.dart';
import 'package:hr_management_application/network/api_service/api_constants.dart';
import 'package:hr_management_application/persistence/share_preference/share_preference_key_constants.dart';
import 'package:http_parser/http_parser.dart';

class EditProfileBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HRMRepoModel _hrmRepoModel = HRMRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emergencyContactController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController workExperienceController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final userNameFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  final emergencyFormKey = GlobalKey<FormState>();
  final educationFormKey = GlobalKey<FormState>();
  final workExperienceFormKey = GlobalKey<FormState>();
  String gender = "";
  bool isEditUnlock = false;
  String cvFileName = "";
  File? cvFile;
  String certificateFileName = "";
  File? certificateFile;
  String recommendationFileName = "";
  File? recommendationLetterFile;
  String profileFromNetwork = PROFILE_PLACE_HOLDER;
  File? profileImageFile;
  int? groupValueForGender;

  EditProfileBloc(UserDataVO? userDataVO) {
    _showLoading();
    if (userDataVO != null &&
        userDataVO.profilePic != null &&
        userDataVO.profilePic?.length != 0) {
      profileFromNetwork =
      "$IMAGE_BASE_URL/${userDataVO.profilePic?.last.imgUrl ?? ""}";
      _notifySafely();
    } else {
      profileFromNetwork = PROFILE_PLACE_HOLDER;
    }
    if (userDataVO != null &&
        userDataVO.cV != null &&
        userDataVO.cV?.length != 0) {
      cvFileName = userDataVO.cV?.last.fileName ?? "";
      _notifySafely();
    }
    if (userDataVO != null &&
        userDataVO.educationCertificate != null &&
        userDataVO.educationCertificate?.length != 0) {
      certificateFileName =
          userDataVO.educationCertificate?.last.fileName ?? "";
      _notifySafely();
    }
    if (userDataVO != null &&
        userDataVO.recommendationLetter != null &&
        userDataVO.recommendationLetter?.length != 0) {
      recommendationFileName =
          userDataVO.recommendationLetter?.last.fileName ?? "";
      _notifySafely();
    }
    userNameController = TextEditingController(text: userDataVO?.givenName);
    emailController = TextEditingController(text: userDataVO?.email);
    phoneController = TextEditingController(text: userDataVO?.phone);
    addressController = TextEditingController(text: userDataVO?.address);
    emergencyContactController =
        TextEditingController(text: userDataVO?.emergencyContact);
    educationController =
        TextEditingController(text: userDataVO?.educationBackground);
    workExperienceController =
        TextEditingController(text: userDataVO?.workExperience);
    isEditUnlock = true;
    _notifySafely();
    if (userDataVO?.gender == "Male") {
      groupValueForGender = 1;
      gender = userDataVO?.gender ?? "";
      _notifySafely();
    } else {
      groupValueForGender = 2;
      gender = userDataVO?.gender ?? "";
      _notifySafely();
    }
    _hideLoading();
  }

  void onChooseGender(int value) {
    if (value == 1) {
      gender = "Male";
      _notifySafely();
    } else {
      gender = "Female";
      _notifySafely();
    }
  }

  void onChooseCV(File file) {
    cvFile = file;
    cvFileName = file.path.split('/').last;
    _notifySafely();
  }

  void onRemoveCV() {
    cvFile = null;
    cvFileName = "";
    _notifySafely();
  }

  void onChooseCertificate(File file) {
    certificateFile = file;
    certificateFileName = file.path.split('/').last;
    _notifySafely();
  }

  void onRemoveCertificate() {
    certificateFile = null;
    certificateFileName = "";
    _notifySafely();
  }

  void onChooseRecommendationLetter(File file) {
    recommendationLetterFile = file;
    recommendationFileName = file.path.split('/').last;
    _notifySafely();
  }

  void onRemoveRecommendation() {
    recommendationLetterFile = null;
    recommendationFileName = "";
    _notifySafely();
  }

  void onChooseProfilePic(File file) {
    profileImageFile = file;
    _notifySafely();
  }

  void validate() {
    bool userNameValidate = (userNameFormKey.currentState?.validate() ?? false);
    bool phoneValid = (phoneFormKey.currentState?.validate() ?? false);
    bool emailValidate = (emailFormKey.currentState?.validate() ?? false);
    bool addressValidate = (addressFormKey.currentState?.validate() ?? false);
    bool emergencyContactValidate =
        (emergencyFormKey.currentState?.validate() ?? false);
    bool educationValidate =
        (educationFormKey.currentState?.validate() ?? false);
    bool workExperienceValidate =
        (workExperienceFormKey.currentState?.validate() ?? false);
    if (userNameValidate &&
        phoneValid &&
        emailValidate &&
        addressValidate &&
        emergencyContactValidate &&
        educationValidate &&
        workExperienceValidate &&
        gender != "") {
      isEditUnlock = true;
      _notifySafely();
    } else {
      isEditUnlock = false;
      _notifySafely();
    }
  }

  Future<FormData> _formDataToUpdateEmployee() async {
    var id = await _hrmRepoModel.getString(EMPLOYEE_ID);
    var formData = FormData.fromMap({
      "id": id,
      "givenName": userNameController.text,
      "gender": gender,
      "phone": phoneController.text,
      "email": emailController.text,
      "address": addressController.text,
      "emergencyContact": emergencyContactController.text,
      "educationBackground": educationController.text,
      "workExperience": workExperienceController.text,
      "cv": (cvFile != null)
          ? await MultipartFile.fromFile(
              cvFile!.path,
              filename: _pathFromFile(cvFile!),
              contentType: MediaType('image', 'png'),
            )
          : null,
      "edu": (certificateFile != null)
          ? await MultipartFile.fromFile(
              certificateFile!.path,
              filename: _pathFromFile(certificateFile!),
              contentType: MediaType('image', 'png'),
            )
          : null,
      "recLet": (recommendationLetterFile != null)
          ? await MultipartFile.fromFile(
              recommendationLetterFile!.path,
              filename: _pathFromFile(recommendationLetterFile!),
              contentType: MediaType('image', 'png'),
            )
          : null,
      "pf": (profileImageFile != null)
          ? await MultipartFile.fromFile(
              profileImageFile!.path,
              filename: _pathFromFile(profileImageFile!),
              contentType: MediaType('image', 'png'),
            )
          : null,
    });
    return Future.value(formData);
  }

  String _pathFromFile(File file) {
    return file.path.split("/").last;
  }

  Future onTapEdit() async {
    _showLoading();
    var formData = await _formDataToUpdateEmployee();
    await _hrmRepoModel.putUserDataUpdate(formData);
    return Future.value();
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
