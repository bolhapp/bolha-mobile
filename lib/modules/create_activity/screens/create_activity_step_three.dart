import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lfg_mobile/modules/create_activity/block/activity_state_block.dart';
import 'package:lfg_mobile/modules/create_activity/components/form_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lfg_mobile/modules/shared/components/datepicker.dart';
import 'package:lfg_mobile/modules/shared/components/time_picker.dart';

class CreateActivityStepThreePage extends StatelessWidget {
  const CreateActivityStepThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(scrollDirection: Axis.vertical, children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(AppLocalizations.of(context)!.participantsLevel,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryFixed,
                          fontWeight: FontWeight.bold,
                          fontSize: 17))),
              Expanded(
                  flex: 0,
                  child: DropdownMenu(
                      onSelected: (data) {
                        context
                            .read<CreateActivityStateCubit>()
                            .setUsersLvl(data);
                      },
                      width: 150,
                      inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        hintStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.w300),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                            value: "man",
                            label: AppLocalizations.of(context)!.man),
                        DropdownMenuEntry(
                            value: "female",
                            label: AppLocalizations.of(context)!.female),
                        DropdownMenuEntry(
                            value: "none",
                            label: AppLocalizations.of(context)!.pressNotSay),
                      ])),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.activityDate,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryFixed,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 5,
              ),
              DatePicker(
                customInputDecoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30, top: 10),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  hintText: AppLocalizations.of(context)!.activityDate,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w300,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                handleChanged: (data) {
                  context.read<CreateActivityStateCubit>().setDate(data);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.start,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryFixed,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TimePicker(
                      customInputDecoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 30, top: 10),
                        filled: true,
                        fillColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        hintText: AppLocalizations.of(context)!.startTime,
                        hintStyle: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w300,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      handleChanged: (data) {
                        context
                            .read<CreateActivityStateCubit>()
                            .setStartTime(data);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.end,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryFixed,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TimePicker(
                      customInputDecoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 30, top: 10),
                        filled: true,
                        fillColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        hintText: AppLocalizations.of(context)!.endTime,
                        hintStyle: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w300,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      handleChanged: (data) {
                        context
                            .read<CreateActivityStateCubit>()
                            .setEndTime(data);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FormInput(
            handleChanged: (data) =>
                context.read<CreateActivityStateCubit>().setRequiremets(data),
            isMultiLine: true,
            inputName: AppLocalizations.of(context)!.requirementsOrRestrictions,
            inputHint:
                AppLocalizations.of(context)!.exRequirementsOrRestrictions,
          ),
          const SizedBox(
            height: 20,
          ),
          FormInput(
            handleChanged: (data) => context
                .read<CreateActivityStateCubit>()
                .setAdictionalInformation(data),
            isMultiLine: true,
            inputName: AppLocalizations.of(context)!.additionalInformation,
            inputHint: AppLocalizations.of(context)!.exAdditionalInformation,
          ),
        ]));
  }
}
