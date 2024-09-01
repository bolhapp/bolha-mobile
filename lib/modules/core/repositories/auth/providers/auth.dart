import 'dart:async';
import 'package:lfg_mobile/modules/core/repositories/auth/models/auth.dart';
import 'package:lfg_mobile/modules/core/http/client.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class AuthApiProvider {
  HttpClient client = HttpClient(resource: "/auth");

  Future<dynamic> register(RegisteUserData data) async {
    final Response<dynamic>  response = await client.post('/register', data, null);

      // If the call to the server was successful, parse the JSON
    return json.decode(response.toString());
  }

  Future<dynamic> login(RegisteUserData data) async {
    final Response<dynamic> response = await client.post('/login', data, null);

    return json.decode(response.toString());
  }
}