import 'dart:async';
import 'package:dio/dio.dart';
import 'package:lfg_mobile/modules/core/http/client.dart';

class ActivitiesApiProvider {
  HttpClient client = HttpClient(resource: "/activities");

  Future<List<dynamic>> get() async {
    final Response<dynamic> response = await client.get('');

    return response.data;
  }
}