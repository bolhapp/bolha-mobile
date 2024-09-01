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
      name: data['name'],
      photo: data['photo'],
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
  final UserProfile host;
  final List<String> activityTypes;
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
    debugPrint(data["host"].toString());
    return Activity(
      id: data["id"],
      name: data["name"],
      createdAt: data["createdAt"] != null ?  DateTime.parse(data["createdAt"]) :
          DateTime.now(),
      description: data["description"] ?? '',
      date:
          data["date"] != null ? DateTime.parse(data["date"]) : DateTime.now(),
      online: data['online'] ?? false,
      address: data["address"] ?? '',
      numParticipants: data["numParticipants"] ?? 0,
      maxParticipants: data["maxParticipants"] ?? 0,
      difficulty: data["difficulty"] ?? 0,
      restrictions:  data["restrictions"] ?? '',
      extraDetails:  data["extraDetails"] ?? '',
      updatedAt:  data["updatedAt"] != null ? DateTime.parse(data["updatedAt"]): 
          DateTime.now(),
      pics:  data["pics"] != null ? List.from(data["pics"]) : List<String>.empty(),
      host: UserProfile.fromJson(data["host"]) ,
      activityTypes:  data["activityTypes"] != null ? List.from(data["activityTypes"])   : List<String>.empty(),
      participants:  data["participants"] != null ? (data["participants"] as List<dynamic>).map((user) => UserProfile.fromJson(user)).toList() :  List<UserProfile>.empty(),
    );
  }
}
