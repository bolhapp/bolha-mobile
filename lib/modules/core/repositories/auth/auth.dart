import 'dart:async';

import 'package:lfg_mobile/modules/core/repositories/auth/models/auth.dart';
import 'package:lfg_mobile/modules/core/repositories/auth/providers/auth.dart';
import 'package:flutter/material.dart';


class AuthRespotitory {
  AuthApiProvider provider = AuthApiProvider();

  Future<UserResponse> registeUser(RegisteUserData data ) async {
    final response = await provider.register(data);
    debugPrint("data");

    return UserResponse.fromJson(response);
  }

  Future<UserResponse> login(RegisteUserData data ) async {
    final response = await provider.login(data);

    return UserResponse.fromJson(response);
  }
}