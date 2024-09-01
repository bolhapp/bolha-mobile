import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lfg_mobile/modules/create_activity/components/form_image_picker.dart';
import 'package:lfg_mobile/modules/create_activity/components/form_input.dart';

class CreateActivityStepTwoPage extends StatefulWidget {
  const CreateActivityStepTwoPage({super.key});

  @override
  State<CreateActivityStepTwoPage> createState() =>
      CreateActivityStepTwoPageState();
}

class CreateActivityStepTwoPageState extends State<CreateActivityStepTwoPage> {
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
                          child: Text("A actividade é online?",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17))),
                      Expanded(
                          flex: 0,
                          child: Switch(
                            thumbIcon:
                                const WidgetStatePropertyAll(Icon(Icons.close)),
                            value: true,
                            onChanged: (bool value) {},
                          )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const FormInput(
                    inputName: "Endereço",
                    inputHint: "Endereço",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Categorias",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          ImageInput(),
                        ],
                      )),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text("Numero de pessoas?",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17))),
                      Expanded(
                          flex: 0,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: 109,
                            height: 39,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Text("5",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Icon(
                                  Icons.add,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ],
                            ),
                          )),
                    ],
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
                        Icons.arrow_right_alt_outlined,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {
                        context.push("/create_activity/step_three");
                      },
                      label: Text(
                        'Seguir',
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
