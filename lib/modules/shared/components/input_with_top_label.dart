import 'package:lfg_mobile/modules/shared/components/common_decoration.dart';
import 'package:flutter/material.dart';

class InputWithTopLabel extends StatelessWidget {
  const InputWithTopLabel(
      {super.key,  required this.inputName,this.hintTextStr, this.handleChanged});

  final String inputName;
  final String? hintTextStr;
  final void Function(String)? handleChanged;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputName,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          onChanged: (data) {
            if(handleChanged != null) {
              handleChanged!(data);
            }
          },
          decoration: TextInputCommonDecoration.textFieldStyle(
            hintTextStr: hintTextStr ?? ''
          ),
        )
      ],
    );
  }
}
