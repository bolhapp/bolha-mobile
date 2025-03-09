import 'package:image_picker/image_picker.dart';

class User {
  final String name;

  const User({
    required this.name
  });

  factory  User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      name: parsedJson['name'] as String
    );
  }
}

class UserProfileData {
  final String? gender;
  final String? name;
  final DateTime? dateOfBirth;
  final XFile?  userProfileImage;

  const UserProfileData({
    this.gender,
    this.name,
    this.dateOfBirth,
    this.userProfileImage,
  });

  factory  UserProfileData.fromJson(Map<String, dynamic> parsedJson) {
    return UserProfileData(
      gender: parsedJson.containsKey("gender") ? parsedJson['gender']  : "",
      name: parsedJson.containsKey("name") ? parsedJson['name']  : "",
      dateOfBirth: parsedJson.containsKey("dateOfBirth") ? parsedJson['dateOfBirth']  : "",
    );
  }
}