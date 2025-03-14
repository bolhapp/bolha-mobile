import 'dart:async';
import 'package:lfg_mobile/modules/core/repositories/notifications/models/notifications.dart';
import 'package:lfg_mobile/modules/core/repositories/notifications/providers/notifications.dart';

class NotificationsRespotitory {
  NotificationsApiProvider provider = NotificationsApiProvider();

  Future<List<NotificationModel>> get() async {
    final response = await provider.get();

    return response.map((el) => NotificationModel.fromJson(el)).toList();
  }
}