import 'package:lfg_mobile/modules/activity_search/components/activity_card_day_widget.dart';
import 'package:lfg_mobile/modules/shared/components/activity_container_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityCard extends StatelessWidget {
  final Function() handleOpenActivityDetail;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String hostName;
  final String hostNamePicture;
  final int participantsCount;
  final int maxParticipants;
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
    required this.hostNamePicture,
    required this.participantsCount,
    required this.maxParticipants,
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
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(title,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.primary))),
                  ActivityCardDayWidget(
                    eventDate: date,
                    isOnline: false,
                  ),
                ],
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
                  ...activityTypes.map((el) => ActivityContainerChip(
                        tag: el,
                      )),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(hostNamePicture),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.hostname,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15),
                      ),
                      Text(
                        hostName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .nOfmParticipants(participantsCount, maxParticipants),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15),
                    )
                  ]),
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
                      AppLocalizations.of(context)!.viewActivity,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        /*  Expanded(
            flex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
             
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton.icon(
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
                      AppLocalizations.of(context)!.viewActivity,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                )
              ],
            )) */
      ],
    );
  }
}
