import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lfg_mobile/modules/create_activity/block/activity_state_block.dart';
import 'package:lfg_mobile/modules/shared/components/activity_select_dialog.dart';

class AddActivityCategories extends StatelessWidget {
  const   AddActivityCategories(
      {
        super.key,
        required this.onCategorySelected,
    }
  );

  final void Function(String) onCategorySelected;

  Future<dynamic> openActivityDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext _) {
        return  BlocProvider<CreateActivityStateCubit>.value(
        value: BlocProvider.of<CreateActivityStateCubit>(context),
        child:  ActivitySelectDialog(
          checkIfSelected: (element) => context.read<CreateActivityStateCubit>().state.categories.any((type) => type.id == element),
          handleListSelect: onCategorySelected,
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        AppLocalizations.of(context)!.add,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Theme.of(context).colorScheme.onPrimary),
      ),
      iconAlignment: IconAlignment.end,
      icon: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 20,
      ),
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(90,40)),
        maximumSize: const WidgetStatePropertyAll(Size(90,40)),
        fixedSize: const WidgetStatePropertyAll(Size(90, 40)),
        alignment: Alignment.centerRight,
        backgroundColor:
            WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
      ),
      onPressed: () {
        openActivityDialog(context);
      },
    );
  }
}
