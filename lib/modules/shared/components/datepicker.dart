import 'package:lfg_mobile/modules/shared/components/common_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, this.restorationId, this.handleChanged});

  final String? restorationId;
  final void Function(String)? handleChanged;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerState extends State<DatePicker> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;
  
  void Function(String)? get handleChanged => widget.handleChanged;
  
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
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
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
      final String newValue = AppLocalizations.of(context)!.datePicker(_selectedDate.value);
      
      if(handleChanged != null) {
        handleChanged!(newValue);
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
          decoration: TextInputCommonDecoration.textFieldStyle(),
          controller: controller,
          ignorePointers: true
        )
    );
  }
}
