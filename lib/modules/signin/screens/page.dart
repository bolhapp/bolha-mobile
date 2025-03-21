import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bolha/modules/signin/components/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 2.0),
                                      child: Image(
                                        height: 150,
                                        image: AssetImage('assets/logo.png'),
                                      )),
                                  const AspectRatio(
                                    aspectRatio: 16 / 1,
                                    child: SizedBox(
                                      height: 10,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 2.0),
                                      child: Text(
                                        AppLocalizations.of(context)!.logIn,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .fontSize),
                                      )),
                                  const AspectRatio(
                                    aspectRatio: 16 / 1,
                                    child: SizedBox(
                                      height: 10,
                                    ),
                                  ),
                                  SignInForm(key: key),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        AppLocalizations.of(context)!.joinWith,
                                      )),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10.0, left: 10.0),
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/google_logo.png'))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10.0, left: 10.0),
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/facebook_logo.png'))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10.0, left: 10.0),
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/instagram_logo.png'))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10.0, left: 10.0),
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/twitter_logo.png'))),
                                      ],
                                    ),
                                  )
                                ])),
                        Expanded(
                            flex: 0,
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .dontHaveAccountRegist),
                                    GestureDetector(
                                        onTap: () {
                                          context.push("/register");
                                        },
                                        child: Text(
                                          AppLocalizations.of(context)!.signUp,
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
