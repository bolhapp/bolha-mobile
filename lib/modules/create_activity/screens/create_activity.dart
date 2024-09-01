import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lfg_mobile/modules/create_activity/components/form_image_picker.dart';
import 'package:lfg_mobile/modules/create_activity/components/form_input.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({super.key});

  @override
  State<CreateActivityPage> createState() => CreateActivityPageState();
}

class CreateActivityPageState extends State<CreateActivityPage> {
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
                  const SizedBox(height: 20),
                  const FormInput(
                    inputName: "titulo da actividade",
                    inputHint: "Ex: Blubie de Leitura",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const FormInput(
                    inputName: "Descricao",
                    inputHint: "Descricao",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Images",
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
                      SizedBox( width: 10, ),
                      ImageInput(),
                      SizedBox( width: 10, ),
                      ImageInput(),
                      SizedBox( width: 10, ),
                      ImageInput(),
                      SizedBox( width: 10, ),
                      ImageInput(),
                    ],
                  )
                  ),
                ])),
            Expanded(
              flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
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
                    context.push("/create_activity/step_two");
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
