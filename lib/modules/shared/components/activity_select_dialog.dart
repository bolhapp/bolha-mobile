import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bolha/modules/core/repositories/activity_types/activity_types.dart';
import 'package:bolha/modules/core/repositories/activity_types/models/activity_types.dart';
import 'package:bolha/modules/shared/components/common_decoration.dart';
import 'package:bolha/modules/shared/utils/activities.dart';

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
  static final List<String> activities = [];
  Function(String) get handleListSelect => widget.handleListSelect;
  Function(String) get checkIfSelected => widget.checkIfSelected;

  @override
  void initState() {
    super.initState();
    activityTypes = ActivityTypesRepository().get();
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
                                color:
                                    Theme.of(context).colorScheme.primaryFixed),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                              decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 30, top: 10),
                            filled: true,
                            fillColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            hintText: AppLocalizations.of(context)!.exAddress,
                            hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontWeight: FontWeight.w300,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          )),
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
                                itemBuilder: (context, index) {
                                  bool isElementSelected = checkIfSelected(
                                      snapshot.data!.activityTypes
                                          .elementAt(index)
                                          .id);
                                  return GestureDetector(
                                    onTap: () {
                                      handleListSelect(snapshot
                                          .data!.activityTypes
                                          .elementAt(index)
                                          .id);

                                      setState(() {});
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: isElementSelected
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primaryFixed
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 40,
                                        child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(children: [
                                              Expanded(
                                                  child: Text(
                                                getActivityTranslation(
                                                    snapshot.data!.activityTypes
                                                        .elementAt(index)
                                                        .id,
                                                    context),
                                                style: TextStyle(
                                                    color: isElementSelected
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .onPrimaryFixedVariant
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary),
                                              )),
                                              Container(
                                                height: 20,
                                                width: 20,
                                                color: isElementSelected
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .secondary
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .secondaryContainer,
                                                child: isElementSelected
                                                    ? Icon(
                                                        Icons.check,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary,
                                                        size: 20,
                                                      )
                                                    : null,
                                              )
                                            ]))),
                                  );
                                },
                                scrollDirection: Axis.vertical,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
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
