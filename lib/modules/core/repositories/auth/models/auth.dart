import 'dart:convert';

class RegisteUserData {
  final String email;
  final String password;

  const RegisteUserData({
    required this.email,
    required this.password
  });

   factory  RegisteUserData.fromJson(Map<String, dynamic> parsedJson) {
    return RegisteUserData(
      email: parsedJson['email'] as String,
      password: parsedJson['password'] as String
    );
  }

  Map<String, dynamic> toJson() =>
    {'email': email, 'password': password};

}

class UserResponse {
  final String id;
  final String accessToken;
  final String email;

  const UserResponse({
    required this.id,
    required this.accessToken,
    required this.email
  });

   factory  UserResponse.fromJson(Map<String, dynamic> parsedJson) {
    return UserResponse(
      email: parsedJson['user']['email'] as String,
      accessToken: parsedJson['token'] as String,
      id: parsedJson['user']['id'] as String
    );
  }
}