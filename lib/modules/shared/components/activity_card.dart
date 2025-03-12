import 'package:flutter/material.dart';
import 'package:lfg_mobile/modules/activity_search/components/activity_card_day_widget.dart';
import 'package:lfg_mobile/modules/shared/utils/activities.dart';

class ActivityCard extends StatelessWidget {
  final Function() handleOpenActivityDetail;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String hostName;
  final int participantsCount;
  final List<String> profilePictures;
  final List<String> activityTypes;

  const ActivityCard({
    super.key,
    required this.title,
    required this.handleOpenActivityDetail,
    required this.description,
    required this.date,
    required this.location,
    required this.hostName,
    required this.participantsCount,
    required this.profilePictures,
    required this.activityTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(title,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              const SizedBox(height: 8),
              Text(description,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 5,
                runSpacing: 2,
                children: [
                  ...activityTypes.map((el) => Container(
                        padding: const EdgeInsets.only(
                          bottom: 5,
                          top: 5,
                          left: 10,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          getActivityTranslation(el, context),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 12),
                        ),
                      )),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/logo.png'), 
                  ),
                  const SizedBox(width: 8),
                  Text(hostName),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (participantsCount > 0)
                    Row(
                      children: [
                        ...profilePictures.map((url) => CircleAvatar(
                              radius: 16,
                              backgroundImage: AssetImage(url),
                            )),
                        const SizedBox(width: 8),
                        const Text('5 of 15'),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
            flex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ActivityCardDayWidget(
                    eventDate: date,
                    isOnline: false,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  icon: Icon(
                    Icons.arrow_right_alt,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                  ),
                  onPressed: () {
                    handleOpenActivityDetail();
                  },
                  label: Text(
                    'Ver detalhes',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
