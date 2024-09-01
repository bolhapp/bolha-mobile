import 'package:flutter/material.dart';

class ImageInput extends StatelessWidget {
  const ImageInput({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            height: 148,
            width: 148,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
                child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.primary,
            )))
      ],
    );
  }
}
