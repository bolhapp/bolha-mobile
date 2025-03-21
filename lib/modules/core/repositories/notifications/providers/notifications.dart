import 'dart:async';
import 'package:bolha/modules/core/http/client.dart';
import 'package:dio/dio.dart';

class NotificationsApiProvider {
  HttpClient client = HttpClient(resource: "/notifications");

  Future<List<dynamic>> get() async {
    final Response<dynamic> response = await client.get('');

    return response.data;
  }
}
