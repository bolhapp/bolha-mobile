import 'package:flutter/material.dart';
import 'package:lfg_mobile/modules/shared/utils/activities.dart';

class ActivityChip extends StatelessWidget {
  const ActivityChip(
      {super.key, required this.activityId, required this.handleDelete});

  final String activityId;
  final Function(String) handleDelete;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Theme.of(context).colorScheme.primary,
      deleteIconColor: Theme.of(context).colorScheme.onPrimary,
      deleteIcon: Icon(
        Icons.close,
        shadows: const [Shadow(blurRadius: 1)],
        weight: 2,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 22,
      ),
      onDeleted: () {
        handleDelete(activityId);
      },
      label: Text(
        getActivityTranslation(activityId, context),
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 17),
      ),
    );
  }
}
