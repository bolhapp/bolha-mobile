import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/models/activities.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/providers/activities.dart';




class ActivitiesRespotitory {
  ActivitiesApiProvider provider = ActivitiesApiProvider();

  Future<List<Activity>> get() async {
    final response = await provider.get(
      0,
      "asc",
      "created_at"
    );

    debugPrint("response.toString()");
    debugPrint(response.toString());
    try {
      debugPrint(response.map((el) => Activity.fromJson(el)).toList().toString());
    } catch(err) {
      debugPrint(err.toString());
    }

    return response.map((el) => Activity.fromJson(el)).toList();
  }
 
  Future<Activity> post(NewActivity data) async {
    final response = await provider.post(data);
   
    return Activity.fromJson(response);
  }
}