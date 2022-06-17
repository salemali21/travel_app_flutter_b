import 'package:dio/dio.dart';

class DioHelper {
  static Dio? _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.apilayer.com/",
        receiveDataWhenStatusError: true,
        headers: {
          "apikey": "Z9T5SqhlguWS7x52MzezzL1qgrNtIcl2",
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? language,
    String? token,
  }) async {
    return await _dio!.get(
      url,
      queryParameters: query,
    );
  }
}
