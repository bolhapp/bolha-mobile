import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lfg_mobile/modules/signup/components/sign_up_step_page_form.dart';

class SignUpStepFormState {
  String? dateOfBirth;
  String? name;
  String? genderDropdown;
  XFile? file;

  SignUpStepFormState();
}


class SignUpStepFormCubit extends Cubit<SignUpStepFormState> {
    SignUpStepFormCubit() : super(SignUpStepFormState());

  void updateName(String value) {
    state.name = value;
    emit(state);
  }
  void updateDateOfBirth(String value) {
    state.dateOfBirth = value;
    emit(state);
  }
  void updateGender(String value) {
    state.genderDropdown = value;
    emit(state);
  }
  void updateProfilePicture(XFile file) {
    state.file = file;
    emit(state);
  }
}

class SignUpStepPage extends StatelessWidget {
  const SignUpStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    child:  BlocProvider(
                      create: (_) => SignUpStepFormCubit(),
                      child: const SignUpStepPageForm(),
                    ), 
    ))));
  }
}
