import 'package:dio/dio.dart';

class UpdatePersonRequestModel {
  String? fullName;
  bool? isFavourite;
  List<String?>? phoneNumber;
  MultipartFile? photoUrl;
  String? birthday;
  String? addressDetail;
  String? emailDetail;

  UpdatePersonRequestModel({
    this.fullName,
    this.isFavourite,
    this.phoneNumber,
    this.photoUrl,
    this.birthday,
    this.addressDetail,
    this.emailDetail,
  });

  // FormData nesnesi oluşturur
  Future<FormData> toFormData() async {
    final data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;

    if (photoUrl != null) {
      // Dosya yüklemesi için MultipartFile'i ekliyoruz
      data['photoUrl'] = photoUrl!;
    }

    data['birthday'] = birthday;
    data['addressDetail'] = addressDetail;
    data['emailDetail'] = emailDetail;

    return FormData.fromMap(data);
  }
}
