import 'package:lfg_mobile/modules/shared/components/datepicker.dart';
import 'package:lfg_mobile/modules/shared/components/gender_dropdown.dart';
import 'package:lfg_mobile/modules/shared/components/input_with_top_label.dart';
import 'package:lfg_mobile/modules/shared/components/profile_image_picker.dart';
import 'package:lfg_mobile/modules/core/repositories/user/models/user.dart';
import 'package:lfg_mobile/modules/core/repositories/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:lfg_mobile/modules/signup/screens/sign_up_step_page.dart';

class SignUpStepPageForm extends StatefulWidget {
  const SignUpStepPageForm({super.key});

  @override
  State<SignUpStepPageForm> createState() => SignUpStepPageFormState();
}

class SignUpStepPageFormState extends State<SignUpStepPageForm> {
  bool isLoading = false;

  Future<void> handleOnContinue() async {
    try {
      setState(() {
        isLoading = true;
      });

      await UserRespotitory().updateUser(UserProfileData(
          gender: context.read<SignUpStepFormCubit>().state.genderDropdown,
          name: context.read<SignUpStepFormCubit>().state.name,
          dateOfBirth: context.read<SignUpStepFormCubit>().state.dateOfBirth,
          userProfileImage: context.read<SignUpStepFormCubit>().state.file));

      context.push("/register/step_tow");

      /// do http request...
    } catch (err) {
      debugPrint(err.toString());
      // handler Err
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.signUpStepHeader,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        ProfileImagePicker(
          handleImageSelected: (data) {
            context.read<SignUpStepFormCubit>().updateProfilePicture(data);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        InputWithTopLabel(
          handleChanged: (data) {
            context.read<SignUpStepFormCubit>().updateName(data);
          },
          inputName: AppLocalizations.of(context)!.name,
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.dateOfBirth,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            DatePicker(
              handleChanged: (data) {
                context.read<SignUpStepFormCubit>().updateDateOfBirth(data);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.gender,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            GenderDropdown(
              handleChanged: (data) {
                context.read<SignUpStepFormCubit>().updateGender(data);
              },
            ),
          ],
        ),
        Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                    fixedSize: const WidgetStatePropertyAll(Size(175, 48)),
                  ),
                  onPressed: () {
                    if (!isLoading) {
                      handleOnContinue();
                    }
                  },
                  child: isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ))
                      : Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                AppLocalizations.of(context)!.continueText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 20,
                            ),
                          ],
                        )),
            ))
      ],
    );
  }
}
