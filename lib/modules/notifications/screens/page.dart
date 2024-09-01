import 'package:lfg_mobile/modules/core/repositories/activities/models/activities.dart';
import 'package:lfg_mobile/modules/core/repositories/notifications/models/notifications.dart';
import 'package:lfg_mobile/modules/core/repositories/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lfg_mobile/modules/notifications/components/activity_list_item_banner.dart';
import 'package:lfg_mobile/modules/notifications/components/user_request_activity_item.dart';

class AgregateNotificationModel {
  final Activity? activity;
  final List<NotificationModel> notifications;

  const AgregateNotificationModel({
    this.activity,
    required this.notifications,
  });
}

List<AgregateNotificationModel> getAggregatedNotificationsData(
    List<NotificationModel> data) {
  List<AgregateNotificationModel> notificationsAgregated = [];
  Map<String, AgregateNotificationModel> mapActivtyIdToList = {};

  for (var notification in data) {
    if (notification.activity == null) {
      notificationsAgregated
          .add(AgregateNotificationModel(notifications: [notification]));
      continue;
    }

    if (mapActivtyIdToList.containsKey(notification.activity!.id)) {
      mapActivtyIdToList[notification.activity!.id]!
          .notifications
          .add(notification);
      continue;
    }
    AgregateNotificationModel newEntry = AgregateNotificationModel(
        notifications: [notification], activity: notification.activity);

    notificationsAgregated.add(newEntry);
    mapActivtyIdToList[notification.activity!.id] = newEntry;
  }

  return notificationsAgregated;
}

List<Widget> getListWidgetBaseOnAggregatedNotifications(
    List<AgregateNotificationModel> notificationsAgregated,
    int itemCount,
    BuildContext context) {
  List<Widget> notificationItems = [
    Row(children: [
      Expanded(
          flex: 0,
          child: Text(
            AppLocalizations.of(context)!.nextActivities,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          )),
      const SizedBox(width: 5),
      const Expanded(flex: 1, child: Divider()),
    ])
  ];

  for (var data in notificationsAgregated) {
    if (data.activity == null) {
      notificationItems
          .add(getWidgetBaseOnNotificationType(data.notifications.first, null));
    }

    if (data.activity != null) {
      notificationItems.addAll([
        ActivityListItemBanner(
          activity: data.activity!,
        ),
        ...data.notifications.map((el) => getWidgetBaseOnNotificationType(
            data.notifications.first, el.activity))
      ]);
    }
  }
  return notificationItems;
}

Widget getWidgetBaseOnNotificationType(
    NotificationModel notification, Activity? activity) {
  if (notification.type == "newRequest") {
    return UserRequestActivityItem(
        invitedUserName: notification.user.name,
        activityId: activity!.id,
        activityRequestId: notification.type);
  }

  return const SizedBox(
    width: 0,
    child: Text("Type not mapped"),
  );
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {
  bool showAllFilter = false;
  late Future<List<NotificationModel>> userNotifications;

  @override
  void initState() {
    super.initState();
    debugPrint("asd");
    userNotifications = NotificationsRespotitory().get();
    debugPrint("done");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
                flex: 1,
                child: FutureBuilder<List<NotificationModel>>(
                    future: userNotifications,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      int itemCount = snapshot.data!.length;
                      List<NotificationModel> itemsClone =
                          List.from(snapshot.data!);
                      // first we sort
                      itemsClone.sort((notA, notB) =>
                          notA.createdAt.isBefore(notB.createdAt) ? 1 : -1);
                      // then we agregate by if has not else will be just a notification
                      List<AgregateNotificationModel> notificationsAgregated =
                          getAggregatedNotificationsData(snapshot.data!);
                      List<Widget> notificationsWidgest =
                          getListWidgetBaseOnAggregatedNotifications(
                              notificationsAgregated, itemCount, context);

                      return ListView.separated(
                          itemBuilder: (_, idx) {
                            return notificationsWidgest[idx];
                          },
                          separatorBuilder: (_, idx) => Divider(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          itemCount: notificationsWidgest.length);
                    }))
          ],
        ));
  }
}
