import 'package:dio/dio.dart';
import 'package:phonediretory2/core/models/request_model.dart/person_request_model/create_person_request_model.dart';
import 'package:phonediretory2/core/models/request_model.dart/person_request_model/update_person_request_model.dart';
import 'package:phonediretory2/core/models/response_model.dart/person_response_model.dart';
import 'package:phonediretory2/core/service/client/rest_client.dart';
import 'package:phonediretory2/main.dart';
import 'package:phonediretory2/shared/strings/shared_prefs_keys.dart';

class PersonServiceFunctions {
  late Dio dio;
  late RestClient service;
  late String token;
  PersonServiceFunctions() {
    dio = Dio();
    service = RestClient(dio);
    token = prefs.getString(PrefsKeys.userToken)!;
  }
  Future<List<PersonResponseModel>> getAll() async {
    try {
      List<PersonResponseModel> personList = await service.getAllUsers(token);
      return personList;
    } catch (e) {
      return [];
    }
  }

  Future<PersonResponseModel> addPerson(
      CreatePersonRequestModel createPersonRequestModel) async {
    PersonResponseModel person =
        await service.createPerson(token, createPersonRequestModel);
    return person;
  }

  Future<PersonResponseModel> deletePerson(int personId) async {
    PersonResponseModel personResponseModel =
        await service.deletePerson(token, personId.toString());

    return personResponseModel;
  }

  Future<PersonResponseModel> updatePerson(
      int personId, UpdatePersonRequestModel updatePersonRequestModel) async {
    PersonResponseModel personResponseModel = await service.updatePerson(
        token, personId.toString(), updatePersonRequestModel);

    return personResponseModel;
  }
}
