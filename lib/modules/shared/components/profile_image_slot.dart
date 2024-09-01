import 'package:flutter/material.dart';

class ProfileImageSlot extends StatelessWidget {
  const ProfileImageSlot({super.key, this.image});

  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xffd7e1e3),
            image: image != null
                ? DecorationImage(
                    fit: BoxFit.fill,
                    image: image!,
                  )
                : null));
  }
}
