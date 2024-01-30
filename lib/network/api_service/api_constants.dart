/// Base Url HRM
const String BASE_URL_HRM = "http://hrmbackend.kwintechnologykw11.com:5000/api";

/// Base Url CRM for only mobile
const String BASE_URL_CRM_MOBILE =
    "http://crmbackend.kwintechnologies.com:3500/api/mobile";

/// Base Url CRM for both mobile and webapp
const String BASE_URL_CRM_BOTH =
    "http://crmbackend.kwintechnologies.com:3500/api";

/// Urls with End points HRM
const String LOGIN_URL = "$BASE_URL_HRM/auth/login";
const String USER_LIST_URL = "$BASE_URL_HRM/users";
const String USER_DATA_URL = "$BASE_URL_HRM/user";
const String LEAVE_URL = "$BASE_URL_HRM/leave";
const String LEAVE_CODE_URL = "$BASE_URL_HRM/leaves/code";
const String ATTENDANCE_URL = "$BASE_URL_HRM/attendances/mobile";
const String REAL_TIME_PAYROLL_URL = "$BASE_URL_HRM/attendances/calculate";
const String CHECKIN_URL_HRM = "$BASE_URL_HRM/attendances/mobile/check-in";
const String PAYSLIP_URL = "$BASE_URL_HRM/payrolls/mobile";
const String LOCATION_URL = "$BASE_URL_HRM/attendances/lat-lng";

/// Urls with End points CRM
const String APPOINTMENT_URL = "$BASE_URL_CRM_MOBILE/appointments";
const String MARKET_REPORT_URL = "$BASE_URL_CRM_BOTH/marketing-reports";

/// Image base url
const String IMAGE_BASE_URL =
    "http://hrmbackend.kwintechnologykw11.com:5000/static/hrm";
