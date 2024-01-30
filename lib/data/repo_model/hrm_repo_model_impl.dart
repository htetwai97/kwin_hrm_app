import 'dart:io';

import 'package:dio/src/form_data.dart';
import 'package:hr_management_application/data/repo_model/hrm_repo_model.dart';
import 'package:hr_management_application/data/vo/leave_code_vo.dart';
import 'package:hr_management_application/network/data_agent/dio_data_agent_impl.dart';
import 'package:hr_management_application/network/responses/get_appointment_list_response.dart';
import 'package:hr_management_application/network/responses/get_attendance_percent_response.dart';
import 'package:hr_management_application/network/responses/get_location_response.dart';
import 'package:hr_management_application/network/responses/get_payslip_response.dart';
import 'package:hr_management_application/network/responses/get_userdata_response.dart';
import 'package:hr_management_application/network/responses/post_employee_leaves_and_date_detail_response.dart';
import 'package:hr_management_application/network/responses/post_hrm_checkin_response.dart';
import 'package:hr_management_application/network/responses/post_hrm_checkout_response.dart';
import 'package:hr_management_application/network/responses/post_login_response.dart';
import 'package:hr_management_application/network/responses/post_real_time_payroll_response.dart';
import 'package:hr_management_application/persistence/share_preference/share_preference.dart';

class HRMRepoModelImpl extends HRMRepoModel {
  HRMRepoModelImpl._internal();

  static final HRMRepoModelImpl _singleton = HRMRepoModelImpl._internal();

  factory HRMRepoModelImpl() => _singleton;

  final _dataAgent = DioDataAgentImpl();
  final _sharePreference = SharePreferenceModel();

  @override
  Future<String> getString(String key) {
    return _sharePreference.getString(key);
  }

  @override
  Future<void> saveString(String key, String value) {
    return _sharePreference.saveString(key, value);
  }

  @override
  Future<PostLoginResponse> postUserLogin(String email, String password) {
    return _dataAgent.postUserLogin(email, password);
  }

  @override
  Future<GetEmployeeDataResponse> getEmployeeData() {
    return _dataAgent.getEmployeeData();
  }

  @override
  Future<void> putUserDataUpdate(FormData formData) {
    return _dataAgent.putUserDataUpdate(formData);
  }

  @override
  Future<void> postLeaveFormCreate(FormData formData) {
    return _dataAgent.postLeaveFormCreate(formData);
  }

  @override
  Future<LeaveCodeVO> getLeaveCode() {
    return _dataAgent.getLeaveCode();
  }

  @override
  Future<GetAttendancePercentResponse> getMonthlyAttendance() {
    return _dataAgent.getMonthlyAttendance();
  }

  @override
  Future<PostEmployeeLeavesAndDateDetailResponse>
      postEmployeeLeavesAndDateDetails(String employeeId, String month) {
    return _dataAgent.postEmployeeLeavesAndDateDetails(employeeId, month);
  }

  @override
  Future<GetAppointmentResponse> getAppointment() {
    return _dataAgent.getAppointment();
  }

  @override
  Future<void> checkInAppointment(String appointmentID, String attendanceId) {
    return _dataAgent.putCrmCheckInAppointment(appointmentID, attendanceId);
  }

  @override
  Future<void> checkOutAppointment(String appointmentID) {
    return _dataAgent.putCrmCheckOutAppointment(appointmentID);
  }

  @override
  Future<String> reportMarketing(
    String contactPerson,
    String contactPersonPhone,
    String followupDate,
    String currentApp,
    String currentDetail,
    String requirement,
    String request,
    String budget,
    String timeline,
    String appointmentID,
    File attach,
  ) {
    return _dataAgent.reportMarketing(
      contactPerson,
      contactPersonPhone,
      followupDate,
      currentApp,
      currentDetail,
      requirement,
      request,
      budget,
      timeline,
      appointmentID,
      attach,
    );
  }

  @override
  Future<PostRealTimePayRollResponse> postRealTimePayRoll(
      String employeeId, String depId, String month, int basicSalary) {
    return _dataAgent.postRealTimePayRoll(
        employeeId, depId, month, basicSalary);
  }

  @override
  Future<PostHRMCheckInResponse> postHrmCheckIn(
      String employeeId,
      String departmentId,
      String clockIn,
      String date,
      double referenceLat,
      double referenceLon,
      double targetLat,
      double targetLan) {
    return _dataAgent.postHrmCheckIn(employeeId, departmentId, clockIn, date,
        referenceLat, referenceLon, targetLat, targetLan);
  }

  @override
  Future<PostHrmCheckOutResponse> postHrmCheckOut(
      String clockOut,
      String attendanceId,
      double referenceLat,
      double referenceLon,
      double targetLat,
      double targetLan) {
    return _dataAgent.postHrmCheckOut(clockOut, attendanceId, referenceLat,
        referenceLon, targetLat, targetLan);
  }

  @override
  Future<GetPaySlipResponse> getPaySlip(String month) {
    return _dataAgent.getPaySlip(month);
  }

  @override
  Future<bool> clearAllSharePrefItems() {
    return _sharePreference.clearAllSharePrefItems();
  }

  @override
  Future<GetLocationResponse> getLocation() {
    return _dataAgent.getLocation();
  }
}
