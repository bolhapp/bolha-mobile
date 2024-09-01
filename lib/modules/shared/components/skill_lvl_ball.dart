import 'package:flutter/material.dart';

class SkillLvlBall extends StatelessWidget {
  const SkillLvlBall(
      {super.key, required this.isFilled});

  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        color: isFilled ? Theme.of(context).colorScheme.primary  : Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
