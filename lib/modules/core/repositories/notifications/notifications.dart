import 'dart:async';
import 'package:bolha/modules/core/repositories/notifications/models/notifications.dart';
import 'package:bolha/modules/core/repositories/notifications/providers/notifications.dart';

class NotificationsRepository {
  NotificationsApiProvider provider = NotificationsApiProvider();

  Future<List<NotificationModel>> get() async {
    final response = await provider.get();

    return response.map((el) => NotificationModel.fromJson(el)).toList();
  }
}
