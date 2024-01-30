import 'package:flutter/foundation.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model_impl.dart';
import 'package:hr_management_application/data/vo/payslip_data_vo.dart';
import 'package:hr_management_application/data/vo/user_data_vo.dart';

class PayslipBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HRMRepoModel _hrmRepoModel = HRMRepoModelImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<PaySlipDataVO> paySlipList = [];
  PaySlipDataVO? paySlipData;
  String month = "";
  UserDataVO? userDataVO;

  PayslipBloc() {
    _showLoading();
    var month = DateTime.now().month;
    switch (month) {
      case 1:
        this.month = "Jan";
        break;
      case 2:
        this.month = "Feb";
        break;
      case 3:
        this.month = "March";
        break;
      case 4:
        this.month = "April";
        break;
      case 5:
        this.month = "May";
        break;
      case 6:
        this.month = "June";
        break;
      case 7:
        this.month = "July";
        break;
      case 8:
        this.month = "Aug";
        break;
      case 9:
        this.month = "Sep";
        break;
      case 10:
        this.month = "Oct";
        break;
      case 11:
        this.month = "Nov";
        break;
      case 12:
        this.month = "Dec";
        break;
      default:
        this.month = "July";
    }
    _hrmRepoModel.getEmployeeData().then((response) {
      userDataVO = response.user;
      _notifySafely();
      _hrmRepoModel.getPaySlip(this.month).then((response) {
        paySlipList = response.data ?? [];
        _notifySafely();
        if (paySlipList.length != 0) {
          paySlipList.take(1);
          paySlipData = paySlipList.elementAt(0);
          _notifySafely();
        }
        _hideLoading();
      });
    });
  }

  void onTapMonth(String month) {
    this.month = month;
    _notifySafely();
    _hrmRepoModel.getPaySlip(month).then((response) {
      paySlipList = response.data ?? [];
      _notifySafely();
      if (paySlipList.length != 0) {
        paySlipList.take(1);
        paySlipData = paySlipList.elementAt(0);
        _notifySafely();
      }
    });
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
