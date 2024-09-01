import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:lfg_mobile/modules/create_activity/components/form_input.dart';

class CreateActivityStepThreePage extends StatefulWidget {
  const CreateActivityStepThreePage({super.key});

  @override
  State<CreateActivityStepThreePage> createState() =>
      CreateActivityStepThreePageState();
}

class CreateActivityStepThreePageState
    extends State<CreateActivityStepThreePage> {
  bool showAllFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Activity',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: ListView(scrollDirection: Axis.vertical, children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text("Nivel dos participantes?",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17))),
                      Expanded(
                          flex: 0,
                          child: DropdownMenu(
                              onSelected: (data) {},
                              width: 150,
                              inputDecorationTheme: InputDecorationTheme(
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.secondary,
                                hintStyle: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w300),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              dropdownMenuEntries: [
                                DropdownMenuEntry(
                                    value: "man",
                                    label: AppLocalizations.of(context)!.man),
                                DropdownMenuEntry(
                                    value: "female",
                                    label:
                                        AppLocalizations.of(context)!.female),
                                DropdownMenuEntry(
                                    value: "none",
                                    label: AppLocalizations.of(context)!
                                        .pressNotSay),
                              ])),
                    ],
                  ),
                    const SizedBox(
                    height: 20,
                  ),
                  const FormInput(
                    inputName: "Data da Actividade",
                    inputHint: "Ex: Blubie de Leitura",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const FormInput(
                    inputName: "Requisitos ou restrições",
                    inputHint: "ex: tem de ter duas maos",
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                  const FormInput(
                    inputName: "Informaçoes adicionar",
                    inputHint: "ex: comvem trazer outro par de tenis",
                  ),
                ])),
            Expanded(
                flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cancelar",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: Icon(
                        Icons.arrow_right_alt_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                   onPressed: () {
                        context.push("/create_activity/step_four");
                      },
                      label: Text(
                        'Finalizar',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
