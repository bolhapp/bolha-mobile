import 'dart:async';
import 'package:lfg_mobile/modules/core/repositories/activity_types/models/activity_types.dart';
import 'package:lfg_mobile/modules/core/repositories/activity_types/providers/activity_types.dart';

class ActivityTypesRespotitory {
  ActivityTypesApiProvider provider = ActivityTypesApiProvider();

  Future<ActivityTypes> get() async {
    final response = await provider.get();
    return ActivityTypes.fromJson(response);
  }
}