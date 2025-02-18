import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lfg_mobile/modules/core/repositories/activity_types/activity_types.dart';
import 'package:lfg_mobile/modules/core/repositories/activity_types/models/activity_types.dart';
import 'package:lfg_mobile/modules/shared/components/common_decoration.dart';
import 'package:lfg_mobile/modules/shared/utils/activities.dart';

class ActivitySelectDialog extends StatefulWidget {
  const ActivitySelectDialog({
    super.key,
    required this.handleListSelect,
    required this.checkIfSelected,
  });

  final Function(String) handleListSelect;
  final Function(String) checkIfSelected;


  @override
  State<ActivitySelectDialog> createState() => ActivitySelectDialogState();
}

class ActivitySelectDialogState extends State<ActivitySelectDialog> {
  late Future<ActivityTypes> activityTypes;
  static final List<String> activitites = [];
  Function(String) get handleListSelect => widget.handleListSelect;
  Function(String) get checkIfSelected => widget.checkIfSelected;
  
  @override
  void initState() {
    super.initState();
    activityTypes = ActivityTypesRespotitory().get();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: FutureBuilder<ActivityTypes>(
                  future: activityTypes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.select_your_interests,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration:
                                TextInputCommonDecoration.textFieldStyle(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              flex: 1,
                              child: ListView.separated(
                                itemCount: snapshot.data!.activityTypes.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 10,
                                ),
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    handleListSelect(snapshot
                                        .data!.activityTypes
                                        .elementAt(index)
                                        .id);

                                    setState(() {});
                                  },
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color(0xffd7e1e3),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 40,
                                      child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(children: [
                                            Expanded(
                                                child: Text(
                                                    getActivityTranslation(
                                                        snapshot
                                                            .data!.activityTypes
                                                            .elementAt(index)
                                                            .id,
                                                        context))),
                                            Container(
                                              height: 20,
                                              width: 20,
                                              color: Theme.of(context).colorScheme.onPrimary,
                                              child: checkIfSelected(snapshot.data!
                                                              .activityTypes
                                                              .elementAt(index)
                                                              .id)
                                                  ? Icon(
                                                      Icons.check,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      size: 20,
                                                    )
                                                  : null,
                                            )
                                          ]))),
                                ),
                                scrollDirection: Axis.vertical,
                              )),
                          TextButton(
                              style: ButtonStyle(
                                alignment: Alignment.centerRight,
                                backgroundColor: WidgetStatePropertyAll(
                                    Theme.of(context).colorScheme.primary),
                                fixedSize:
                                    const WidgetStatePropertyAll(Size(175, 48)),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      AppLocalizations.of(context)!.done,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            )));
  }
}
