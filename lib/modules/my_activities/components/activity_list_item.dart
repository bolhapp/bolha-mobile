import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:bolha/modules/core/repositories/activities/models/activities.dart';
import 'package:bolha/modules/notifications/components/activity_list_item_banner.dart';
import 'package:bolha/modules/shared/components/activity_bottom_drawer.dart';

class ActivityListItem extends StatelessWidget {
  const ActivityListItem({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityListItemBanner(activity: activity),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton.icon(
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact,
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  enableDrag: true,
                  scrollControlDisabledMaxHeightRatio: 100,
                  context: context,
                  builder: (BuildContext context) {
                    return ActivityBottomDrawer(
                      activity: activity,
                      showJoin: false,
                    );
                  },
                );
              },
              icon: Icon(
                Icons.arrow_right_alt,
                color: Theme.of(context).colorScheme.primary,
              ),
              iconAlignment: IconAlignment.end,
              label: Text(
                AppLocalizations.of(context)!.viewActivity,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              )),
        )
      ],
    );
  }
}
