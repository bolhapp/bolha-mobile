import 'package:dio/dio.dart';
import 'package:lfg_mobile/modules/core/access_token/access_token.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpClient {
  String resource = "";
  bool isAuthenticated = false;

  HttpClient({
    required this.resource,
    this.isAuthenticated = false,
  });

  static String baseUrl =
      dotenv.get("API_URL", fallback: "http://10.0.2.2:3000/api/v1");

  static final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    headers: {"Content-Type": "application/json"},
    validateStatus: (statusCode) {
      if (statusCode == null) {
        return false;
      }
      if (statusCode == 422) {
        // your http status code
        return true;
      } else {
        return statusCode >= 200 && statusCode < 300;
      }
    },
  );

  Future<Dio> getDio() async {
    final Dio dio = Dio(options);
    if (!isAuthenticated) {
      return Dio(options);
    }

    final String? accessToken = await getToken();

    if (accessToken == null || accessToken.isEmpty) {
      throw Exception('No access Token Available');
    }

    dio.options.headers = {
      "Authorization": "Bearer $accessToken",
    };

    return Dio(options);
  }

  Future<dynamic> get(
      [String path = "",
      Map<String, dynamic>? queryParameters = const {}]) async {
    final Dio dio = await getDio();
    return dio.get(options.baseUrl + resource + path,
        queryParameters: queryParameters);
  }

  Future<dynamic> post(
      {String path = "",
      Object data = const {},
      Options? customOptions}) async {
    final Dio dio = await getDio();

    return dio.post(options.baseUrl + resource + path,
        options: customOptions, data: data);
  }
}
