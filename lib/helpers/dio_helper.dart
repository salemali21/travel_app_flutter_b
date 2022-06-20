import 'package:dio/dio.dart';
import 'package:travel_app/helpers/network_url.dart';

class DioHelper {
  static Dio? _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
        headers: {
          "apikey": API_KEY,
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
