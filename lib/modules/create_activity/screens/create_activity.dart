import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bolha/modules/create_activity/block/activity_state_block.dart';
import 'package:bolha/modules/create_activity/components/form_image_picker.dart';
import 'package:bolha/modules/create_activity/components/form_input.dart';
import 'package:bolha/modules/shared/components/image_picker_component.dart';

class CreateActivityPage extends StatelessWidget {
  const CreateActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: ListView(scrollDirection: Axis.vertical, children: [
              const SizedBox(height: 20),
              FormInput(
                handleChanged: (data) {
                  context.read<CreateActivityStateCubit>().setTitle(data);
                },
                isMultiLine: false,
                inputName: AppLocalizations.of(context)!.activityTitle,
                inputHint: AppLocalizations.of(context)!.exActivityTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              FormInput(
                handleChanged: (data) => context
                    .read<CreateActivityStateCubit>()
                    .setDescription(data),
                isMultiLine: true,
                inputName: AppLocalizations.of(context)!.description,
                inputHint: AppLocalizations.of(context)!.exDescription,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)!.images,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryFixed,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 150,
                  child: ListView.separated(
                    itemBuilder: (_, idx) {
                      if (idx >=
                          context
                              .read<CreateActivityStateCubit>()
                              .state
                              .images
                              .length) {
                        return ImagemPickerComponent(
                          getImagePlaceholder: (img) => ImageInput(
                            image: img,
                          ),
                          handleImageSelected: (XFile data) => {
                            context
                                .read<CreateActivityStateCubit>()
                                .addImage(data)
                          },
                        );
                      }
                      return ImagemPickerComponent(
                        image: context
                            .watch<CreateActivityStateCubit>()
                            .state
                            .images
                            .elementAt(idx),
                        getImagePlaceholder: (img) => ImageInput(
                          image: img,
                        ),
                        handleImageSelected: (data) => context
                            .read<CreateActivityStateCubit>()
                            .setImages(data),
                      );
                    },
                    itemCount: context
                            .watch<CreateActivityStateCubit>()
                            .state
                            .images
                            .length +
                        1,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, idx) => const SizedBox(
                      width: 10,
                    ),
                  )),
            ])),
      ],
    );
  }
}
