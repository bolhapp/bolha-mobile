import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bolha/modules/activity_search/components/activity_card.dart';
import 'package:bolha/modules/core/repositories/activities/activities.dart';
import 'package:bolha/modules/core/repositories/activities/models/activities.dart';
import 'package:bolha/modules/shared/components/activity_bottom_drawer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool showAllFilter = false;
  late Future<List<Activity>> userActivities;

  @override
  void initState() {
    super.initState();
    userActivities = ActivitiesRepository().get();
  }

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar

          TextField(
              decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.secondary,
            hintText: '${AppLocalizations.of(context)!.search}...',
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            suffixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          )),

          const SizedBox(height: 16),

          // Filter chips

          Row(
            children: [
              FilterChip(
                color: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary),
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                label: const Text('Porto'),
                selected: true,
                onSelected: (_) {},
                checkmarkColor: Theme.of(context).colorScheme.onPrimary,
              ),
              Builder(
                builder: (_) {
                  if (showAllFilter) {
                    return FilterChip(
                      color: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.primary),
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                      label: const Text('Porto'),
                      selected: true,
                      onSelected: (_) {},
                      checkmarkColor: Theme.of(context).colorScheme.onPrimary,
                    );
                  }

                  return Container();
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('+5 Filtros'),
                selected: false,
                onSelected: (_) {
                  setState(() {
                    showAllFilter = true;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          Expanded(
              flex: 1,
              child: FutureBuilder<List<Activity>>(
                  future: userActivities,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    int itemCount = snapshot.data!.length;

                    if (itemCount == 0) {
                      return const Text("None");
                    }

                    return Column(
                      children: [
                        Expanded(
                            flex: 0,
                            child: Row(
                              children: [
                                Text(
                                    AppLocalizations.of(context)!
                                        .nActivitiesFound(itemCount),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryFixed,
                                    )),
                                const Expanded(
                                    flex: 1,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Divider())),
                              ],
                            )),
                        const SizedBox(height: 16),
                        Expanded(
                            flex: 1,
                            child: ListView.separated(
                                itemBuilder: (_, idx) => ActivityCard(
                                      handleOpenActivityDetail: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ActivityBottomDrawer(
                                              activity:
                                                  snapshot.data!.elementAt(idx),
                                              showJoin: true,
                                            );
                                          },
                                        );
                                      },
                                      key: UniqueKey(),
                                      title: snapshot.data!.elementAt(idx).name,
                                      maxParticipants: snapshot.data!
                                          .elementAt(idx)
                                          .maxParticipants,
                                      hostNamePicture:
                                          null /*  snapshot.data!
                                          .elementAt(idx)
                                          .host
                                          .photo */
                                      ,
                                      activityTypes: snapshot.data!
                                          .elementAt(idx)
                                          .activityTypes,
                                      description: snapshot.data!
                                          .elementAt(idx)
                                          .description,
                                      date: snapshot.data!.elementAt(idx).date,
                                      location: 'Online',
                                      hostName: snapshot.data!
                                          .elementAt(idx)
                                          .host!
                                          .name,
                                      participantsCount: snapshot.data!
                                          .elementAt(idx)
                                          .maxParticipants,
                                      profilePictures: const [],
                                    ),
                                separatorBuilder: (_, idx) => Divider(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                itemCount: itemCount))
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
