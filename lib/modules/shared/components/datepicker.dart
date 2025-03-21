import 'package:bolha/modules/shared/components/common_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DatePicker extends StatefulWidget {
  const DatePicker(
      {super.key,
      this.restorationId,
      this.handleChanged,
      this.customInputDecoration});

  final String? restorationId;
  final InputDecoration? customInputDecoration;
  final void Function(DateTime)? handleChanged;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerState extends State<DatePicker> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  void Function(DateTime)? get handleChanged => widget.handleChanged;
  InputDecoration? get customInputDecoration => widget.customInputDecoration;

  final TextEditingController controller = TextEditingController();
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @override
  void dispose() {
    _selectedDate.dispose();
    controller.dispose();
    _restorableDatePickerRouteFuture.dispose();
    super.dispose();
  }

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      final String newValue =
          AppLocalizations.of(context)!.datePicker(_selectedDate.value);

      if (handleChanged != null) {
        handleChanged!(newSelectedDate);
      }

      setState(() {
        controller.text = newValue;
        _selectedDate.value = newSelectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _restorableDatePickerRouteFuture.present();
        },
        child: TextFormField(
            decoration: customInputDecoration ??
                TextInputCommonDecoration.textFieldStyle(),
            controller: controller,
            ignorePointers: true));
  }
}
