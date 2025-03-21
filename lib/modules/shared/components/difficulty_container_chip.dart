import 'package:flutter/material.dart';
import 'package:lfg_mobile/modules/shared/utils/activities.dart';

class DifficultyContainerChip extends StatelessWidget {
  const DifficultyContainerChip({super.key, required this.lvl});

  final int lvl;

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
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        getActivitySkillLvlTranslation(lvl.toString(), context),
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary, fontSize: 12),
      ),
    );
  }
}
