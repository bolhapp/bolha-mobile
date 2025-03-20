import 'dart:async';
import 'package:lfg_mobile/modules/core/repositories/activities/models/activities.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/providers/activities.dart';

class ActivitiesRepository {
  ActivitiesApiProvider provider = ActivitiesApiProvider();

  Future<List<Activity>> get() async {
    final response = await provider.get(0, "asc", "created_at");

    return response.map((el) => Activity.fromJson(el)).toList();
  }

  Future<Activity> post(NewActivity data) async {
    final response = await provider.post(data);

    return Activity.fromJson(response);
  }
}
