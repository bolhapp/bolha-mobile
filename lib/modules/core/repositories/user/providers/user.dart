import 'dart:async';
import 'dart:convert';

import 'package:bolha/modules/core/http/client.dart';
import 'package:bolha/modules/core/repositories/user/models/user.dart';
import 'package:dio/dio.dart';

class UserApiProvider {
  HttpClient client = HttpClient(resource: "/user", isAuthenticated: true);

  Future<dynamic> updateUser(UserProfileData userProfileData) async {
    FormData formData = FormData.fromMap({
      "name": userProfileData.name,
      "gender": userProfileData.gender,
      "dateOfBirth": userProfileData.dateOfBirth,
      "image": "",
    });

    if (userProfileData.userProfileImage != null) {
      MultipartFile file = await MultipartFile.fromFile(
          userProfileData.userProfileImage!.path,
          filename: "picture.png",
          contentType: DioMediaType('image', 'png'));
      formData.files.add(MapEntry("img", file));
    }

    final response = await client.post(
        data: formData,
        customOptions: Options(contentType: "multipart/form-data"));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return json.decode(response.toString());
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
