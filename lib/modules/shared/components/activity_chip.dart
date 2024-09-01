import 'package:flutter/material.dart';

class ActivityChip extends StatelessWidget {
  const ActivityChip({super.key, required this.tag, required this.handleDelete});

  final String tag;
  final Function(String) handleDelete;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xffd7e1e3),
      deleteIconColor: Colors.white,
      deleteIcon: Icon(
        Icons.close,
        shadows: const [Shadow(blurRadius: 1)],
        weight: 2,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 22,
      ),
      onDeleted: () {
        handleDelete(tag);
      },
      label: Text(tag),
    );
  }
}
