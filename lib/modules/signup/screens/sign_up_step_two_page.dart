import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bolha/modules/signup/block/sign_up_step_two_page_state.dart';
import 'package:bolha/modules/signup/components/sign_up_step_two_page_form.dart';

class SignUpStepTwoPage extends StatelessWidget {
  const SignUpStepTwoPage({super.key});

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
                    child: BlocProvider(
                      create: (_) => SignUpStepTwoPageFormCubit(),
                      child: const SignUpStepTwoPageForm(),
                    )))));
  }
}
