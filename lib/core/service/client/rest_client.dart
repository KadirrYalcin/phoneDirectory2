import 'package:dio/dio.dart';
import 'package:phonediretory2/core/models/request_model.dart/person_request_model/create_person_request_model.dart';
import 'package:phonediretory2/core/models/request_model.dart/person_request_model/update_person_request_model.dart';
import 'package:phonediretory2/core/models/request_model.dart/user_login_model/user_login_model.dart';
import 'package:phonediretory2/core/models/request_model.dart/user_register_model/user_register_model.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:phonediretory2/core/models/response_model.dart/user_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'rest_client.g.dart';

const String servicePhotoUrl = 'https://192.168.12.105/uploads/';

@RestApi(baseUrl: 'https://192.168.12.105/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
//Auth
  @POST('api/account/login')
  Future<UserResponseModel> loginService(@Body() UserLoginModel userLoginModel);

  @POST('api/account/register')
  Future<UserResponseModel> registerService(
      @Body() UserRegisterModel userRegisterModel);

//Person
  @GET('person/Person/GetAll')
  Future<List<PersonResponseModel>> getAllUsers(
      @Header("Authorization") String token);

  @GET('person/Person/{id}')
  Future<PersonResponseModel> getPersonById(@Path("id") String id);

  @POST('person/Person/CreatePerson')
  Future<PersonResponseModel> createPerson(
      @Header("Authorization") String token,
      @Body() CreatePersonRequestModel createPersonRequestModel);

  @PUT('person/Person/UpdatePerson/{PersonId}')
  Future<PersonResponseModel> updatePerson(
      @Header("Authorization") String token,
      @Path("PersonId") String personId,
      @Body() UpdatePersonRequestModel updatePersonRequestModel);

  @DELETE('person/Person/DeletePerson/{PersonId}')
  Future<PersonResponseModel> deletePerson(
      @Header("Authorization") String token, @Path("PersonId") String personId);
}
