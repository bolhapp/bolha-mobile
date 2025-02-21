import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/activities.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/models/activities.dart';
import 'package:lfg_mobile/modules/my_activities/components/activity_list_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool showAllFilter = false;
  late Future<List<Activity>> userActivitites;

  @override
  void initState() {
    super.initState();
    userActivitites = ActivitiesRespotitory().get();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                  flex: 1,
                  child: FutureBuilder<List<Activity>>(
                      future: userActivitites,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        
                        int itemCount = snapshot.data!.length;

                        if (itemCount == 0) {
                            return const Text("Empttg");
                        }

                        return ListView.separated(
                            itemBuilder: (_, idx) {
                              if (idx == 0) {
                                return Column(children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 0,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .nextActivities,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )),
                                      const SizedBox(width: 5),
                                      const Expanded(flex: 1, child: Divider()),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  ActivityListItem(
                                    activity: snapshot.data!.elementAt(idx),
                                  )
                                ]);
                              }
                              return ActivityListItem(
                                activity: snapshot.data!.elementAt(idx),
                              );
                            },
                            separatorBuilder: (_, idx) => Divider(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                            itemCount: itemCount);
                      }))
            ],
          ));
  }
}
