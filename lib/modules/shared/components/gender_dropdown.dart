import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bolha/modules/shared/components/common_decoration.dart';
import 'package:flutter/material.dart';

class GenderDropdown extends StatelessWidget {
  const GenderDropdown({super.key, this.handleChanged});

  final void Function(String)? handleChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        onSelected: (data) {
          if (handleChanged != null) {
            handleChanged!(data!);
          }
        },
        inputDecorationTheme: InputDecorationTheme(
            border: TextInputCommonDecoration.textFieldStyle().border),
        width: MediaQuery.of(context).size.width,
        dropdownMenuEntries: [
          DropdownMenuEntry(
              value: "man", label: AppLocalizations.of(context)!.man),
          DropdownMenuEntry(
              value: "female", label: AppLocalizations.of(context)!.female),
          DropdownMenuEntry(
              value: "none", label: AppLocalizations.of(context)!.pressNotSay),
        ]);
  }
}
