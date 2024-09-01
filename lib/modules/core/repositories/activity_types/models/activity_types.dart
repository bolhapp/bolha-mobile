
class ActivityTypes {
  final List<ActivityType> activityTypes;

  const ActivityTypes({
    required this.activityTypes,
  });

   factory  ActivityTypes.fromJson(List<dynamic> parsedJson) {
    return ActivityTypes(
      activityTypes: parsedJson.map((x) => ActivityType(id: x['id'])).toList()
    );
  }
}

class ActivityType {
  final String id;

  const ActivityType({
    required this.id,
  });

   factory  ActivityType.fromJson(Map<String, dynamic> parsedJson) {
    return ActivityType(
      id: parsedJson["id"] as String,
    );
  }
}