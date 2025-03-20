import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RecoverAccountForm extends StatefulWidget {
  const RecoverAccountForm({super.key});

  @override
  State<RecoverAccountForm> createState() => RecoverAccountFormState();
}

class RecoverAccountFormState extends State<RecoverAccountForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.email,
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromARGB(0, 114, 113, 113)))),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
          ElevatedButton(
            style: ButtonStyle(
                maximumSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary)),
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              if (_formKey.currentState!.validate()) {
                // Process data.
              }
            },
            child: Text(
              AppLocalizations.of(context)!.logIn,
              style: const TextStyle(fontSize: 15, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
