import 'package:lfg_mobile/modules/core/repositories/activity_types/models/activity_types.dart';
import 'package:lfg_mobile/modules/shared/components/activity_skill_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lfg_mobile/modules/shared/components/activity_select_dialog.dart';
import 'package:lfg_mobile/modules/shared/components/common_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lfg_mobile/modules/signup/block/sign_up_step_two_page_state.dart';

class SignUpStepTwoPageForm extends StatelessWidget {
  const SignUpStepTwoPageForm({super.key});

  Future<dynamic> openActivityDialog(BuildContext context) async {
    final currentContextBloc = context.read<SignUpStepTwoPageFormCubit>();
  
    return await showDialog(
      context: context,
      builder: (BuildContext _) {
        return  BlocProvider<SignUpStepTwoPageFormCubit>.value(
        value: context.watch<SignUpStepTwoPageFormCubit>(),
        child:  ActivitySelectDialog(
          checkIfSelected: (element) => context.read<SignUpStepTwoPageFormCubit>().state.activities.any((type) => type.activityTag == element),
          handleListSelect: (p0) {
            if (context.read<SignUpStepTwoPageFormCubit>().state.activities.any((d) => d.activityTag == p0)) {
              context.read<SignUpStepTwoPageFormCubit>().deleteActivity(p0);
            } else {
              context.read<SignUpStepTwoPageFormCubit>().addActivity(p0);
            }
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.last_details,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.tellUsAboutYourself,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
                height: 100,
                child: TextField(
                    onChanged: (data) => context.read<SignUpStepTwoPageFormCubit>().updateBio(data),
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: TextInputCommonDecoration.textFieldStyle())),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          AppLocalizations.of(context)!.select_your_interests,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        const SizedBox(height: 5),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: [
            for (var item in context.watch<SignUpStepTwoPageFormCubit>().state.activities) 
              ActivitySkillSelector(
                activityTag: item.activityTag,
                activitySkillLvl: item.skillLvl,
                handleDelete: (data) => context.read<SignUpStepTwoPageFormCubit>().deleteActivity(data),
                handleSkillLvlIncrease: (data) => context.read<SignUpStepTwoPageFormCubit>().increaseActivitySkillLvl(data),
                handleSkillLvlDecrease: (data) => context.read<SignUpStepTwoPageFormCubit>().decreaseActivitySkillLvl(data),
              ),
            TextButton(
                style: ButtonStyle(
                  alignment: Alignment.centerRight,
                  backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  fixedSize: const WidgetStatePropertyAll(Size(96, 29)),
                ),
                onPressed: () {
                 openActivityDialog(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 20,
                    ),
                  ],
                )),
          ],
        ),
        Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  style: ButtonStyle(
                    alignment: Alignment.centerRight,
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                    fixedSize: const WidgetStatePropertyAll(Size(175, 48)),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          AppLocalizations.of(context)!.complete,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      )
                    ],
                  )),
            ))
      ],
    );
  }
}
