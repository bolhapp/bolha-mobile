import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    required this.inputName,
    required this.inputHint,
    required this.isMultiLine,
    required this.handleChanged,
  });

  final Function(String) handleChanged;
  final String inputName;
  final bool isMultiLine;
  final String inputHint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputName,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primaryFixed,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            height: isMultiLine ? 150 : 80,
            child: TextField(
                onChanged: handleChanged,
                maxLines: isMultiLine ? null : 1,
                expands: isMultiLine,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                keyboardType:
                    isMultiLine ? TextInputType.multiline : TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30, top: 10), 
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  hintText: inputHint,
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w300,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ))),
      ],
    );
  }
}
