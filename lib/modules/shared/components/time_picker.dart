import 'package:lfg_mobile/modules/shared/components/common_decoration.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker(
      {
        super.key,
        required this.handleChanged,
        this.customInputDecoration
    });

  final InputDecoration? customInputDecoration;
  final void Function(String) handleChanged;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  void Function(String) get handleChanged => widget.handleChanged;
  InputDecoration? get customInputDecoration => widget.customInputDecoration;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            initialEntryMode: TimePickerEntryMode.dialOnly,
          );
          if(time != null) {
            setState(() {
              controller.text = time.format(context);
            });
            handleChanged(time.format(context));
          }
        },
        child: TextFormField(
            decoration: customInputDecoration ??
                TextInputCommonDecoration.textFieldStyle(),
            controller: controller,
            ignorePointers: true));
  }
}
