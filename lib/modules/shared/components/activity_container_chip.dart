import 'package:flutter/material.dart';
import 'package:bolha/modules/shared/utils/activities.dart';

class ActivityContainerChip extends StatelessWidget {
  const ActivityContainerChip({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 5,
        top: 5,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryFixed,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        getActivityTranslation(tag, context),
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
            fontSize: 12),
      ),
    );
  }
}
