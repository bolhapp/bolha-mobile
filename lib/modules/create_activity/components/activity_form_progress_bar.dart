import 'package:flutter/material.dart';

class ActivityFormProgressBar extends StatelessWidget {
  const ActivityFormProgressBar({super.key, required this.currentFormPosition});

  final int currentFormPosition;

  Color getColor(int checkPosition, BuildContext context) {
    if (checkPosition <= currentFormPosition) {
      return Theme.of(context).colorScheme.primary;
    }

    return Theme.of(context).colorScheme.secondary;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
              color: getColor(0, context),
              borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: 2,
          width: 80,
          decoration: BoxDecoration(
            color: getColor(1, context),
          ),
        ),
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
              color: getColor(1, context),
              borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: 2,
          width: 80,
          decoration: BoxDecoration(
            color: getColor(2, context),
          ),
        ),
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
              color: getColor(2, context),
              borderRadius: BorderRadius.circular(50)),
        ),
      ],
    );
  }
}
