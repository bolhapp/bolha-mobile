import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lfg_mobile/modules/core/repositories/activity_types/models/activity_types.dart';
import 'package:lfg_mobile/modules/create_activity/block/activity_state_block.dart';
import 'package:lfg_mobile/modules/location_selector/screens/location_selector.dart';
import 'package:lfg_mobile/modules/shared/components/activity_chip.dart';
import 'package:lfg_mobile/modules/shared/components/add_activity_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateActivityStepTwoPage extends StatelessWidget {
  const CreateActivityStepTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController = TextEditingController();

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(scrollDirection: Axis.vertical, children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(AppLocalizations.of(context)!.isOnline,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 17))),
              Expanded(
                  flex: 0,
                  child: Switch(
                    thumbIcon: const WidgetStatePropertyAll(Icon(Icons.close)),
                    value: context.watch<CreateActivityStateCubit>().state.isOnline,
                    onChanged: context.read<CreateActivityStateCubit>().setIsOnline,
                  )),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.address,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: addressController,
                onTap: () async  {
                    final ILocationSelector? result = await context.push<ILocationSelector>('/location_selector');
                    if(result != null) {
                      addressController.value = TextEditingValue(text: result.description);
                    }
                },
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  hintText: AppLocalizations.of(context)!.exAddress,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w300,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.categories,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(spacing: 10, runSpacing: 10, children: [
            for (ActivityType item in (context
                    .watch<CreateActivityStateCubit>()
                    .state
                    .categories))
              ActivityChip(
                activityId: item.id,
                handleDelete: (data) => context
                    .read<CreateActivityStateCubit>()
                    .deleteCategory(item.id),
              ),
            AddActivityCategories(
              onCategorySelected: (categoryId) {
                List<ActivityType> categories =
                    context.read<CreateActivityStateCubit>().state.categories;
                if (categories.any((el) => el.id == categoryId)) {
                  context
                      .read<CreateActivityStateCubit>()
                      .deleteCategory(categoryId);
                  return;
                }
                context
                    .read<CreateActivityStateCubit>()
                    .addCategory(categoryId);
              }
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(AppLocalizations.of(context)!.maxParticipants,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 17))),
              Expanded(
                  flex: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 109,
                    height: 39,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => context
                              .read<CreateActivityStateCubit>()
                              .decreaseMaxParticipantsCounter(),
                          child: Icon(
                            Icons.remove,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Builder(
                          builder: (_) {
                            // Whenever the state changes, only the Text is rebuilt.
                            final state = context.watch<CreateActivityStateCubit>().state.maxParticipants;
                            return Text(state.toString());
                          },
                        ),
                        GestureDetector(
                          onTap: () => context
                              .read<CreateActivityStateCubit>()
                              .increaseMaxParticipantsCounter(),
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ]));
  }
}
