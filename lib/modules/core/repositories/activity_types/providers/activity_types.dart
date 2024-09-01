import 'dart:async';
import 'package:lfg_mobile/modules/core/http/client.dart';
import 'package:dio/dio.dart';

class ActivityTypesApiProvider {
  HttpClient client = HttpClient(resource: "/activityTypes");

  Future<List<dynamic>> get() async {
    final Response<dynamic> response = await client.get('');

    return response.data;
  }
}