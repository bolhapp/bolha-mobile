import 'package:bolha/modules/shared/components/skill_lvl_ball.dart';
import 'package:flutter/material.dart';
import 'package:bolha/modules/shared/utils/activities.dart';

class ActivitySkillSelector extends StatelessWidget {
  const ActivitySkillSelector(
      {super.key,
      required this.activityTag,
      required this.activitySkillLvl,
      required this.handleDelete,
      required this.handleSkillLvlIncrease,
      required this.handleSkillLvlDecrease});

  final String activityTag;
  final int activitySkillLvl;
  final Function(String) handleDelete;
  final Function(String) handleSkillLvlIncrease;
  final Function(String) handleSkillLvlDecrease;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            getActivitySkillLvlTranslation(
                activitySkillLvl.toString(), context),
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                handleDelete(activityTag);
              },
              color: Colors.red,
            ),
            Text(getActivityTranslation(activityTag, context),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            IconButton(
              padding: EdgeInsets.zero,
              style: ButtonStyle(
                  alignment: Alignment.center,
                  minimumSize: const WidgetStatePropertyAll(Size(30, 30)),
                  maximumSize: const WidgetStatePropertyAll(Size(30, 30)),
                  iconSize: const WidgetStatePropertyAll(30),
                  backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  iconColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.onPrimary)),
              icon: const Icon(Icons.remove),
              onPressed: () {
                handleSkillLvlDecrease(activityTag);
              },
            ),
            SkillLvlBall(
              isFilled: activitySkillLvl >= 1,
            ),
            const SizedBox(
              width: 10,
            ),
            SkillLvlBall(
              isFilled: activitySkillLvl >= 2,
            ),
            const SizedBox(
              width: 10,
            ),
            SkillLvlBall(
              isFilled: activitySkillLvl >= 3,
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                handleSkillLvlIncrease(activityTag);
              },
              padding: EdgeInsets.zero,
              style: ButtonStyle(
                  alignment: Alignment.center,
                  minimumSize: const WidgetStatePropertyAll(Size(30, 30)),
                  maximumSize: const WidgetStatePropertyAll(Size(30, 30)),
                  iconSize: const WidgetStatePropertyAll(30),
                  backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  iconColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.onPrimary)),
            ),
          ],
        )
      ],
    );
  }
}
