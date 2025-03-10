import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserRequestActivityItem extends StatelessWidget {
  const UserRequestActivityItem(
      {super.key,
      required this.invitedUserName,
      required this.activityId,
      required this.activityRequestId});

  final String invitedUserName;
  final String activityId;
  final String activityRequestId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              invitedUserName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              AppLocalizations.of(context)!.wantsToJoinYourActivity,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 13,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              iconAlignment: IconAlignment.end,
              icon: Icon(
                Icons.clear,
                color: Theme.of(context).colorScheme.primary,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () { },
              label: Text(
                AppLocalizations.of(context)!.reject,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
            ElevatedButton.icon(
              iconAlignment: IconAlignment.end,
              icon: Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary),
              ),
              onPressed: () { },
              label: Text(
                AppLocalizations.of(context)!.accept,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppLocalizations.of(context)!.viewProfile,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
