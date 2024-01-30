import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hr_management_application/data/vo/leave_code_vo.dart';
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

abstract class DioDataAgent {
  Future<PostLoginResponse> postUserLogin(String email, String password);
  Future<GetEmployeeDataResponse> getEmployeeData();
  Future<void> putUserDataUpdate(FormData formData);
  Future<void> postLeaveFormCreate(FormData formData);
  Future<LeaveCodeVO> getLeaveCode();
  Future<GetAttendancePercentResponse> getMonthlyAttendance();
  Future<PostEmployeeLeavesAndDateDetailResponse>
      postEmployeeLeavesAndDateDetails(String employeeId, String month);
  Future<GetAppointmentResponse> getAppointment();
  Future<void> putCrmCheckInAppointment(String appointmentID, String attendanceId);
  Future<void> putCrmCheckOutAppointment(String appointmentID);
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
  );
  Future<PostRealTimePayRollResponse> postRealTimePayRoll(
      String employeeId, String depId, String month, int basicSalary);
  Future<PostHRMCheckInResponse> postHrmCheckIn(
      String employeeId,
      String departmentId,
      String clockIn,
      String date,
      double referenceLat,
      double referenceLon,
      double targetLat,
      double targetLan);
  Future<PostHrmCheckOutResponse> postHrmCheckOut(
      String clockOut,
      String attendanceId,
      double referenceLat,
      double referenceLon,
      double targetLat,
      double targetLan);
  Future<GetPaySlipResponse> getPaySlip(String month);
  Future<GetLocationResponse> getLocation();
}
