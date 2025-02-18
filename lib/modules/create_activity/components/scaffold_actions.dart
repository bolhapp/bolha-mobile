import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityFirstStepActions extends StatelessWidget {
  const ActivityFirstStepActions(
      { super.key });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            AppLocalizations.of(context)!.cancel,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ElevatedButton.icon(
          iconAlignment: IconAlignment.end,
          icon: Icon(
            Icons.arrow_right_alt_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
          ),
          onPressed: () {
            context.push("/create_activity/step_two");
          },
          label: Text(
            AppLocalizations.of(context)!.next,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        )
      ],
    );
  }
}

class ActivitySecondThirdStepActions extends StatelessWidget {
  const ActivitySecondThirdStepActions(
    { 
      super.key,
      required this.currentPath
    }
  );

  final String currentPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            AppLocalizations.of(context)!.goBack,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ElevatedButton.icon(
          iconAlignment: IconAlignment.end,
          icon: Icon(
            Icons.arrow_right_alt_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
          ),
          onPressed: () {
            if(currentPath == "/create_activity/step_three") {
              context.push("/create_activity/step_four");
            }

            if(currentPath == "/create_activity/step_two") {
              context.push("/create_activity/step_three");
            }
          },
          label: Text(
            AppLocalizations.of(context)!.next,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        )
      ],
    );
  }
}