import 'package:flutter/material.dart';

class UserProfile {
  final String id;
  final String name;
  final String photo;

  const UserProfile({
    required this.id,
    required this.name,
    required this.photo,
  });
  factory UserProfile.fromJson(dynamic data) {
    return UserProfile(
      id: data['id'],
      name: data['name'] ?? "",
      photo: data['photo'] ?? "",
    );
  }
}

class Activity {
  final String id;
  final String name;
  final DateTime createdAt;
  final String description;
  final DateTime date;
  final bool online;
  final String address;
  final int numParticipants;
  final int maxParticipants;
  final int difficulty;
  final String restrictions;
  final String extraDetails;
  final DateTime updatedAt;
  final List<String> pics;
  final List<String> activityTypes;
  final UserProfile? host;
  final List<UserProfile> participants;

  const Activity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.description,
    required this.date,
    required this.online,
    required this.address,
    required this.numParticipants,
    required this.maxParticipants,
    required this.difficulty,
    required this.restrictions,
    required this.extraDetails,
    required this.updatedAt,
    required this.pics,
    required this.host,
    required this.activityTypes,
    required this.participants,
  });

  factory Activity.fromJson(dynamic data) {
    debugPrint("data['id']");
    debugPrint(data['id']);
    debugPrint("teste");
    return Activity(
      id: data["id"],
      name: data["name"],
      createdAt: data["createdAt"] != null
          ? DateTime.parse(data["createdAt"])
          : DateTime.now(),
      description: data["description"] ?? '',
      date:
          data["date"] != null ? DateTime.parse(data["date"]) : DateTime.now(),
      online: data['online'] ?? false,
      address: data["address"] ?? '',
      numParticipants: data["numParticipants"] ?? 0,
      maxParticipants: data["maxParticipants"] ?? 0,
      difficulty: data["difficulty"] ?? 0,
      restrictions: data["restrictions"] ?? '',
      extraDetails: data["extraDetails"] ?? '',
      updatedAt: data["updatedAt"] != null
          ? DateTime.parse(data["updatedAt"])
          : DateTime.now(),
      pics:
          data["pics"] != null ? List.from(data["pics"]) : List<String>.empty(),
      host: data["host"] != null ? UserProfile.fromJson(data["host"]) : null,
      activityTypes: data["activityTypes"] != null
          ? List.from(data["activityTypes"])
          : List<String>.empty(),
      participants: data["participants"] != null
          ? (data["participants"] as List<dynamic>)
              .where((el) => el != null)
              .map((user) => UserProfile.fromJson(user))
              .toList()
          : List<UserProfile>.empty(),
    );
  }
}

class NewActivity {
  final String name;
  final String description;
  final String startTime;
  final String endTime;
  final String date;
  final bool online;
  final String address;
  final int maxParticipants;
  final int difficulty;
  final String restrictions;
  final String extraDetails;
  final List<String> pics;
  final List<String> activityTypes;

  const NewActivity({
    required this.name,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.online,
    required this.address,
    required this.maxParticipants,
    required this.difficulty,
    required this.restrictions,
    required this.extraDetails,
    required this.pics,
    required this.activityTypes,
  });

  Object toJson() {
    return {
      "name": name,
      "description": description,
      "date": date,
      "online": online,
      "address": address,
      "maxParticipants": maxParticipants,
      "difficulty": difficulty,
      "restrictions": restrictions,
      "extraDetails": extraDetails,
      "pics": pics,
      "activityTypes": activityTypes,
      "startTime": startTime,
      "endTime": endTime,
    };
  }
}
