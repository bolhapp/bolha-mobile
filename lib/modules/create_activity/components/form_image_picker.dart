import 'package:flutter/material.dart';

class ImageInput extends StatelessWidget {
  const ImageInput({
    super.key,
    this.image
  });

  final ImageProvider? image;


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
            child: image == null ? Center(
                child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.primary,
            )): Image(fit: BoxFit.fill, image: image as ImageProvider))
      ],
    );
  }
}
