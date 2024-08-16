import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonediretory2/core/models/request_model.dart/user_register_model/user_register_model.dart';

import '../../main.dart';
import '../../shared/strings/strings.dart';
import '../../widgets/toast_widget.dart';
import '../models/request_model.dart/user_login_model/user_login_model.dart';
import '../models/response_model.dart/user_response_model.dart';
import 'auth_service/auth_service.dart';

class AuthFunctions {
  static Future<void> tryLogin(
      {required BuildContext context,
      required bool rememberClicked,
      required UserLoginModel userLoginModel}) async {
    try {
      Dio dio = Dio();
      AuthService service = AuthService(dio);

      UserResponseModel response = await service.loginService(userLoginModel);
      prefs.setString("userToken", response.token!);
      if (rememberClicked) {
        prefs.setString("userUsername", userLoginModel.email);
        prefs.setString("userPassword", userLoginModel.password);
      }
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      showToastMessage(Strings.invalidUser);
    }
  }

  static Future<bool> tryRemember({required BuildContext context}) async {
    UserLoginModel userLoginModel = UserLoginModel(
        email: prefs.getString("userUsername") ?? "",
        password: prefs.getString("userPassword") ?? "");
    try {
      Dio dio = Dio();
      AuthService service = AuthService(dio);
      UserResponseModel response = await service.loginService(userLoginModel);
      prefs.setString("userToken", response.token!);
      return true;
    } catch (e) {
      showToastMessage(Strings.unExpectedError);
      return false;
    }
  }

  static Future<void> tryRegister(
      {required BuildContext context,
      required UserRegisterModel userRegisterModel}) async {
    try {
      Dio dio = Dio();
      AuthService service = AuthService(dio);
      UserResponseModel response =
          await service.registerService(userRegisterModel);
      prefs.setString("userToken", response.token!);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      showToastMessage(Strings.invalidUser);
    }
  }
}
