import 'package:flutter/material.dart';

class ParticipantLvlCheckbox extends StatelessWidget {
  const ParticipantLvlCheckbox(
      {super.key, required this.participantLevelIdentifier});
  final String participantLevelIdentifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (data) {}),
        Text(
          participantLevelIdentifier,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ],
    );
  }
}
