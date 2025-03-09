import 'dart:async';
import 'package:dio/dio.dart';
import 'package:lfg_mobile/modules/core/http/client.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/models/activities.dart';

class ActivitiesApiProvider {
  HttpClient client =
      HttpClient(resource: "/activities", isAuthenticated: true);

  Future<List<dynamic>> get(
      int page, String sortOrder, String sortField) async {
    final Response<dynamic> response =
        await client.get('', {"page": page, "sortOrder": sortOrder, "sortField": sortField});

    return response.data;
  }

  Future<Map<String, dynamic>> post(NewActivity data) async {
    final Response<dynamic> response =
        await client.post(data: data.toJson());

    return response.data;
  }
}
