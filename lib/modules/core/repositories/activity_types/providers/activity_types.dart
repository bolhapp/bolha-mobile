import 'dart:async';
import 'package:lfg_mobile/modules/core/http/client.dart';
import 'package:dio/dio.dart';

class ActivityTypesApiProvider {
  HttpClient client = HttpClient(resource: "/activity-types", isAuthenticated: true);

  Future<List<dynamic>> get() async {
    final Response<dynamic> response = await client.get();

    return response.data;
  }
}