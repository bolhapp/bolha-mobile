import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityCardDayWidget extends StatelessWidget {
  const ActivityCardDayWidget({
    super.key,
    required this.isOnline,
    required this.eventDate,
  });

  final bool isOnline;
  final DateTime eventDate;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        children: [
          Text(isOnline ? AppLocalizations.of(context)!.online : "City???",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary)),
          const Divider(
            color: Colors.white,
          ),
          Text(
            AppLocalizations.of(context)!.getDay(eventDate),
            style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary)
          ),
          Text(AppLocalizations.of(context)!.getMonth(eventDate),
            style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary)
          ),
        ],
      ),
    );
  }
}
