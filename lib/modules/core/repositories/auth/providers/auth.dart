import 'dart:async';
import 'package:lfg_mobile/modules/core/repositories/auth/models/auth.dart';
import 'package:lfg_mobile/modules/core/http/client.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class AuthApiProvider {
  HttpClient client = HttpClient(resource: "/auth", isAuthenticated: false);

  Future<dynamic> register(RegisteUserData data) async {
    final Response<dynamic>  response = await client.post(path: '/register', data: data);

    return json.decode(response.toString());
  }

  Future<dynamic> login(RegisteUserData data) async {
    final Response<dynamic> response = await client.post(path: '/login', data: json.encode(data.toJson()));

    return json.decode(response.toString());
  }
}