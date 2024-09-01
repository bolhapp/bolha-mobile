
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lfg_mobile/modules/core/access_token/acces_token.dart';

class HttpClient {
  String resource = "";
  bool isAuthenticated = false;
  
  HttpClient({
    required this.resource,
     this.isAuthenticated = false,
  });

  static String baseUrl = "https://f2a8350e-31e5-4952-b8f1-d9818b7ba6f2.mock.pstmn.io";
  static final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );

  
  Future<Dio> getDio() async {
    final Dio dio = Dio(options);
    if(!isAuthenticated) {
      return Dio(options);
    }   

    final String? accessToken = await getToken();
    debugPrint(accessToken);
    
    if(accessToken == null || accessToken.isEmpty) {
      throw Exception('No access Token Available');
    } 

    dio.options.headers = {
      "Authorization": "Bearer $accessToken",
    };

    return Dio(options);
  }

  Future<dynamic> get(String path) async {
    final Dio dio = await getDio();

    return dio.get(options.baseUrl+resource+path);
  }
  
  Future<dynamic> post(String path, Object data, Options? customOptions) async {
    final Dio dio = await getDio();
 
    return dio.post(
      options.baseUrl+resource+path,
      options: customOptions,
      data: data
    );
  }

}