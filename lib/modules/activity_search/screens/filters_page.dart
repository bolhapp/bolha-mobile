import 'package:go_router/go_router.dart';
import 'package:lfg_mobile/modules/activity_search/components/search.dart';
import 'package:lfg_mobile/modules/location_selector/screens/location_selector.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/activities.dart';
import 'package:lfg_mobile/modules/core/repositories/activities/models/activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lfg_mobile/modules/shared/components/datepicker.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => FiltersState();
}

class FiltersState extends State<FiltersPage> {
  bool showAllFilter = false;
  late Future<List<Activity>> userActivitites;
  final TextEditingController addressController = TextEditingController();

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Atividades",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          Text(
            "Data de Inicio",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          const SizedBox(height: 10),
          DatePicker(
            customInputDecoration: InputDecoration(
              prefixIcon: Icon(
                Icons.calendar_today,
                color: Theme.of(context).colorScheme.primary,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              hintText: AppLocalizations.of(context)!.activityDate,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w300,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            handleChanged: (data) {},
          ),
          const SizedBox(height: 10),
          Text(
            "Data de Fim",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          const SizedBox(height: 10),
          DatePicker(
            customInputDecoration: InputDecoration(
              prefixIcon: Icon(
                Icons.calendar_today,
                color: Theme.of(context).colorScheme.primary,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              hintText: AppLocalizations.of(context)!.activityDate,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w300,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            handleChanged: (data) {},
          ),
          const SizedBox(height: 10),
          Text(
            "Cidade",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          const SizedBox(height: 10),
          TextField(
              controller: addressController,
              onTap: () async {
                final ILocationSelector? result =
                    await context.push<ILocationSelector>('/location_selector');
                if (result != null) {
                  addressController.value =
                      TextEditingValue(text: result.description);
                }
              },
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                hintText: "Select the City",
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w300,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              )),
          const SizedBox(height: 10),
          Text(
            "Nivel dos Participantes",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          const SizedBox(height: 10),
         const Row(
            children: [
              ParticipantLvlCheckbox(participantLevelIndentifier: "Beginner"),
              ParticipantLvlCheckbox(participantLevelIndentifier: "Intermedio"),
              ParticipantLvlCheckbox(participantLevelIndentifier: "Avançado"),
            ]
          ,)
        ],
      ),
    );
  }
}
