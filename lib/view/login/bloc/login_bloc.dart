import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hr_management_application/core/core_functions/functions.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/network/responses/post_login_response.dart';
import 'package:hr_management_application/persistence/share_preference/share_preference_key_constants.dart';

class LoginBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HRMRepoModel _hrmRepoModel = HRMRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  bool isObscure = true;
  bool isLoginUnlock = false;
  PostLoginResponse? postLoginResponse;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  bool emailV = false;
  bool passwordV = false;
  bool isChecked = false;

  LoginBloc();

  void onTapVisibility() {
    isObscure = !isObscure;
    _notifySafely();
  }

  void emailValidate() {
    emailV = (emailFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void passwordValidate() {
    passwordV = (passwordFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void _validate() {
    if (emailV && passwordV) {
      isLoginUnlock = true;
      _notifySafely();
    }
  }

  void onCheckRememberMe(bool isChecked) {
    this.isChecked = isChecked;
    _notifySafely();
  }

  Future onTapLogin() async {
    _showLoading();
    await _hrmRepoModel
        .postUserLogin(emailController.text, passwordController.text)
        .then((response) {
      postLoginResponse = response;
      _notifySafely();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });

    if (postLoginResponse != null) {
      if (isChecked) {
        await _hrmRepoModel.saveString(EMAIL, emailController.text);
        await _hrmRepoModel.saveString(PASSWORD, passwordController.text);
      }
      Functions.toast(msg: "Login success", status: true);
      _hideLoading();
      return Future.value();
    } else {
      _hideLoading();
      Functions.toast(msg: "Incorrect Email or Password", status: false);
      return Future.error("Error value ==> ${postLoginResponse.toString()}");
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
