import 'package:bolha/modules/core/access_token/access_token.dart';
import 'package:bolha/modules/shared/components/common_decoration.dart';
import 'package:bolha/modules/core/repositories/auth/auth.dart';
import 'package:bolha/modules/core/repositories/auth/models/auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailInputController =
      TextEditingController(text: "tiagoalves943@gmail.com");
  final TextEditingController _passwordInputController =
      TextEditingController(text: "Teset123!");
  bool isLoading = false;

  Future<void> handleLogin(BuildContext context) async {
    try {
      isLoading = true;
      setState(() {});
      UserResponse data = await AuthRepository().login(RegisteUserData(
          email: _emailInputController.text,
          password: _passwordInputController.text));

      await storeToken(data.accessToken);
      context.go("/search");
    } catch (err) {
      // handle error
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: _emailInputController,
                textAlign: TextAlign.left,
                decoration: TextInputCommonDecoration.textFieldStyle(
                    hintTextStr: AppLocalizations.of(context)!.email),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: TextFormField(
                obscureText: true,
                controller: _passwordInputController,
                enableSuggestions: false,
                autocorrect: false,
                textAlign: TextAlign.left,
                decoration: TextInputCommonDecoration.textFieldStyle(
                    hintTextStr: AppLocalizations.of(context)!.password),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                  onTap: () {
                    context.push("/recover_account");
                  },
                  child: Text(
                    textAlign: TextAlign.right,
                    AppLocalizations.of(context)!.recoverPassword,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize),
                  ))),
          ElevatedButton(
            style: ButtonStyle(
                maximumSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary)),
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              if (_formKey.currentState!.validate()) {
                handleLogin(context);
              }
            },
            child: isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ))
                : Text(
                    AppLocalizations.of(context)!.login,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
          ),
        ],
      ),
    );
  }
}
