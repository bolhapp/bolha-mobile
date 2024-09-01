class ActivityRequest {
  final String userId;
  final String activityId;
  final String activityRequestId;

  const ActivityRequest({
    required this.userId,
    required this.activityId,
    required this.activityRequestId,
  });

  factory ActivityRequest.fromJson(dynamic data) {
    return ActivityRequest(
      activityRequestId: data["activityRequestId"],
      activityId: data["activityId"],
      userId: data["userId"],
    );
  }
}