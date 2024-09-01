import 'dart:async';
import 'package:lfg_mobile/modules/core/repositories/activities/models/activities.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/providers/activities.dart';

class ActivitiesRespotitory {
  ActivitiesApiProvider provider = ActivitiesApiProvider();

  Future<List<Activity>> get() async {
    final response = await provider.get();
    
    return response.map((el) => Activity.fromJson(el)).toList();
  }
}