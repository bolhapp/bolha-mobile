import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

String getActivityTranslation(String activityType, BuildContext context) {
  final activityNames = {
    "basket": AppLocalizations.of(context)!.basket,
    "soccer": AppLocalizations.of(context)!.soccer,
  };

  return activityNames[activityType] ?? activityType;
}

String getActivitySkillLvlTranslation(String skillLvl, BuildContext context) {
  final skillLvlNames = {
    "0": AppLocalizations.of(context)!.interested,
    "1": AppLocalizations.of(context)!.beginner,
    "2": AppLocalizations.of(context)!.mid,
    "3": AppLocalizations.of(context)!.pro,
  };

  return skillLvlNames[skillLvl] ?? skillLvl;
}
