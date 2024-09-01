import 'package:lfg_mobile/modules/core/access_token/acces_token.dart';
import 'package:lfg_mobile/modules/shared/components/common_decoration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lfg_mobile/modules/core/repositories/auth/auth.dart';
import 'package:lfg_mobile/modules/core/repositories/auth/models/auth.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailInputControler = TextEditingController();
  final TextEditingController _passwordInputControler = TextEditingController();
  bool isLoading = false;

  Future<void> handleRegisteUser(BuildContext context) async {
    try {
      isLoading = true;
      setState(() {});
      UserResponse data = await AuthRespotitory().registeUser(
        RegisteUserData(
          email: _emailInputControler.value.toString(),
          password: _passwordInputControler.value.toString()
        )
      );

      await storeToken(data.accessToken);
      context.go("/register/step_one");
    } catch (err) {
      debugPrint(err.toString());
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
                textAlign: TextAlign.left,
                controller: _emailInputControler,
                ignorePointers: isLoading,
                decoration: TextInputCommonDecoration.textFieldStyle(
                    hintTextStr: AppLocalizations.of(context)!.email),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseEnterSomeText;
                  }
                  return null;
                },
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: _passwordInputControler,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                textAlign: TextAlign.left,
                ignorePointers: isLoading,
                decoration: TextInputCommonDecoration.textFieldStyle(
                hintTextStr: AppLocalizations.of(context)!.password),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseEnterSomeText;
                  }
                  return null;
                },
              )),
          ElevatedButton(
            style: ButtonStyle(
              maximumSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
              backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary)
            ),
            onPressed: () {
              if (_formKey.currentState!.validate() && !isLoading) {
                handleRegisteUser(context);
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
                  AppLocalizations.of(context)!.confirm,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
          ),
        ],
      ),
    );
  }
}
