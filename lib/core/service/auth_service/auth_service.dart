import 'package:dio/dio.dart';
import 'package:phonediretory2/core/models/request_model.dart/user_login_model/user_login_model.dart';
import 'package:phonediretory2/core/models/request_model.dart/user_register_model/user_register_model.dart';
import 'package:phonediretory2/core/models/response_model.dart/user_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'auth_service.g.dart';

@RestApi(baseUrl: 'https://192.168.12.117/')
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;
  @POST('api/account/login')
  Future<UserResponseModel> loginService(@Body() UserLoginModel userLoginModel);
  @POST('api/account/register')
  Future<UserResponseModel> registerService(
      @Body() UserRegisterModel userRegisterModel);
}
