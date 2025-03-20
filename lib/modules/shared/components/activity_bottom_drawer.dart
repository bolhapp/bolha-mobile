import 'package:lfg_mobile/modules/activity_search/components/activity_card_day_widget.dart';
import 'package:lfg_mobile/modules/shared/components/activity_container_chip.dart';
import 'package:lfg_mobile/modules/shared/components/difficulty_container_chip.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/models/activities.dart';
import 'package:flutter/material.dart';

class ActivityBottomDrawer extends StatelessWidget {
  const ActivityBottomDrawer(
      {super.key, required this.activity, required this.showJoin});

  final Activity activity;
  final bool showJoin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(activity.name,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.primary)))),
                  Expanded(
                      flex: 0,
                      child: ActivityCardDayWidget(
                        isOnline: true,
                        eventDate: activity.date,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: CarouselView(
                  scrollDirection: Axis.horizontal,
                  itemExtent: double.infinity,
                  itemSnapping: true,
                  children: [
                    ...activity.pics.map((e) => Image(
                          image: NetworkImage(e),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(activity.host!.photo),
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
                            activity.host!.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage('assets/logo.png'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppLocalizations.of(context)!.nOfmParticipants(
                            activity.numParticipants, activity.maxParticipants),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                activity.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  ...activity.activityTypes
                      .map((el) => ActivityContainerChip(tag: el)),
                  DifficultyContainerChip(lvl: activity.difficulty)
                ],
              ),
              showJoin
                  ? ElevatedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: Icon(
                        Icons.arrow_right_alt,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {},
                      label: Text(
                        AppLocalizations.of(context)!.join,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    )
                  : const SizedBox(
                      width: 0,
                    )
            ],
          ),
        ));
  }
}
