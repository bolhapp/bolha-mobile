import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bolha/modules/recover_account/components/recover_account_form.dart';

class RecoverAccountPage extends StatelessWidget {
  const RecoverAccountPage({super.key});

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
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(bottom: 50.0),
                                    child: Image(
                                      height: 150,
                                      image: AssetImage('assets/logo.png'),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 2.0),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .recoverPassword,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .fontSize),
                                    )),
                                RecoverAccountForm(
                                  key: key,
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 0,
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .alreadyHaveAnAccount),
                                    GestureDetector(
                                        onTap: () {
                                          context.push("/");
                                        },
                                        child: Text(
                                          AppLocalizations.of(context)!.signIn,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ))
                                  ],
                                )))
                      ],
                    )))));
  }
}
