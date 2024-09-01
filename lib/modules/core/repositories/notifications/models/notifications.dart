import 'package:lfg_mobile/modules/core/repositories/activities/models/activities.dart';
import 'package:lfg_mobile/modules/core/repositories/activity_request/models/activity_request.dart';

class NotificationModel {
  final String id;
  final String type;
  final DateTime createdAt;
  final UserProfile user;
  final Activity? activity;
  final ActivityRequest? activityRequest;

  const NotificationModel(
      {
        required this.type,
      required this.id,
      required this.createdAt,
      required this.user,
      required this.activity,
      required this.activityRequest
    });

  factory NotificationModel.fromJson(dynamic data) {
    return NotificationModel(
        createdAt: data["createdAt"] != null
            ? DateTime.parse(data["createdAt"])
            : DateTime.now(),
        user: UserProfile.fromJson(data["user"]),
        id: data["id"],
        activity: data["activity"] != null
            ? Activity.fromJson(data["activity"])
            : null,
        activityRequest: data["activityRequest"] != null
            ? ActivityRequest.fromJson(data["activityRequest"])
            : null,
        type: data["createdAt"]);
  }
}
