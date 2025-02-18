import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lfg_mobile/modules/create_activity/block/activity_state_block.dart';
import 'package:lfg_mobile/modules/create_activity/components/activity_form_progress_bar.dart';
import 'package:lfg_mobile/modules/create_activity/components/scaffold_actions.dart';

class ActivityScaffold extends StatelessWidget {
  const ActivityScaffold(
      {super.key, required this.child, required this.currentPath});

  static CreateActivityStateCubit mybloc = CreateActivityStateCubit();
  final Widget child;
  final String currentPath;

  Widget? getActionButtons(context) {
    if (currentPath == "/create_activity") {
      return const ActivityFirstStepActions();
    }

    if (currentPath == "/create_activity/step_two" ||
        currentPath == "/create_activity/step_three") {
      return ActivitySecondThirdStepActions(currentPath: currentPath);
    }

    return null;
  }

  int getCurrentStepNumber() {
    if (currentPath == "/create_activity") {
      return 0;
    }
    if (currentPath == "/create_activity/step_two") {
      return 1;
    }
    if (currentPath == "/create_activity/step_three") {
      return 2;
    }

    return 0;
  }

  PreferredSizeWidget? getHeader(BuildContext context) {
    if (currentPath == "/create_activity/step_four") {
      return null;
    }

    return AppBar(
        actions: const [],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Create Activity',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getHeader(context),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                currentPath != "/create_activity/step_four"
                    ? ActivityFormProgressBar(
                        currentFormPosition: getCurrentStepNumber(),
                      )
                    : const SizedBox(),
                Expanded(
                    flex: 1,
                    child: BlocProvider<CreateActivityStateCubit>.value(
                      value: mybloc,
                      child: child,
                    ))
              ],
            )),
        bottomNavigationBar: getActionButtons(context));
  }
}
