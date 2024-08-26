import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/request_model.dart/user_register_model/user_register_model.dart';
import 'package:phonediretory2/shared/strings/shared_prefs_keys.dart';

import '../../../main.dart';
import '../../../shared/strings/strings.dart';
import '../../../widgets/toast_widget.dart';
import '../../models/request_model.dart/user_login_model/user_login_model.dart';
import '../../models/response_model.dart/user_response_model.dart';
import '../client/rest_client.dart';

class AuthFunctions {
  static Future<void> tryLogin(
      {required BuildContext context,
      required bool rememberClicked,
      required UserLoginModel userLoginModel}) async {
    try {
      Dio dio = Dio();
      RestClient service = RestClient(dio);

      UserResponseModel response = await service.loginService(userLoginModel);
      var token = "Bearer ${response.token}";
      prefs.setString(PrefsKeys.userToken, token);
      if (rememberClicked) {
        prefs.setString(PrefsKeys.userEmail, userLoginModel.email);
        prefs.setString(PrefsKeys.userPassword, userLoginModel.password);
      }
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      showToastMessage(Strings.invalidUser);
    }
  }

  static Future<bool> tryRemember({required BuildContext context}) async {
    UserLoginModel userLoginModel = UserLoginModel(
        email: prefs.getString(PrefsKeys.userEmail) ?? "",
        password: prefs.getString(PrefsKeys.userPassword) ?? "");
    try {
      Dio dio = Dio();
      RestClient service = RestClient(dio);
      UserResponseModel response =
          await service.loginService(userLoginModel).timeout(
        const Duration(seconds: 3),
        onTimeout: () {
          throw TimeoutException('login timed out');
        },
      );

      var token = "Bearer ${response.token}";
      prefs.setString(PrefsKeys.userToken, token);
      return true;
    } on DioException catch (_) {
      showToastMessage(Strings.unExpectedError);
      return false;
    } catch (_) {
      showToastMessage(Strings.loginFailedError);
      return false;
    }
  }

  static Future<void> tryRegister(
      {required BuildContext context,
      required UserRegisterModel userRegisterModel}) async {
    try {
      Dio dio = Dio();
      RestClient service = RestClient(dio);
      UserResponseModel response =
          await service.registerService(userRegisterModel);
      var token = "Bearer ${response.token}";
      prefs.setString(PrefsKeys.userToken, token);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      showToastMessage(Strings.invalidUser);
    }
  }
}
