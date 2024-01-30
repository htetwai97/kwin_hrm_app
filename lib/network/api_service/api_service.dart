import 'package:dio/dio.dart';

class DioUtil {
  static Dio getDio(String? token) {
    var dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(minutes: 2),
        contentType: 'application/json',
        headers: {
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': token
        },
      ),
    );
    return dio;
  }
}
