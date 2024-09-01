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
      email: parsedJson['email'] as String,
      accessToken: parsedJson['accessToken'] as String,
      id: parsedJson['id'] as String
    );
  }
}