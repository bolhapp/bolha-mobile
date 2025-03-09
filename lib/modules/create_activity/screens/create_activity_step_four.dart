import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateActivityStepFourPage extends StatefulWidget {
  const CreateActivityStepFourPage({super.key});

  @override
  State<CreateActivityStepFourPage> createState() =>
      CreateActivityStepFourPageState();
}

class CreateActivityStepFourPageState
    extends State<CreateActivityStepFourPage> {
  bool showAllFilter = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton.filled(
              iconSize: 90,
              style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Theme.of(context).colorScheme.primaryFixed),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
            )),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Parebens!",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primaryFixed,
                fontWeight: FontWeight.w800,
                fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "A sua atividade foi criada. Toque em compartilhar para convidar os seus amigos a participarem.",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primaryFixed,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            iconAlignment: IconAlignment.end,
            icon: Icon(
              Icons.share,
              color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
            ),
            style: ButtonStyle(
              minimumSize: const WidgetStatePropertyAll(Size(165, 48)),
              backgroundColor:
                  WidgetStatePropertyAll(Theme.of(context).colorScheme.primaryFixed),
            ),
            onPressed: () {
              context.push("/search");
            },
            label: Text(
              'Compartilhar',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                  fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Ver Actividade",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryFixed,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Voltar ao Inicio",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryFixed,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
