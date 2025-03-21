import 'dart:async';
import 'package:bolha/modules/core/repositories/user/models/user.dart';
import 'package:bolha/modules/core/repositories/user/providers/user.dart';

class UserRepository {
  UserApiProvider provider = UserApiProvider();

  Future<UserProfileData> updateUser(UserProfileData userProfileData) async {
    final response = await provider.updateUser(userProfileData);

    return UserProfileData.fromJson(response);
  }
}
