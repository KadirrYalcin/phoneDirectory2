import 'package:dio/dio.dart';

class CreatePersonRequestModel {
  String? fullName;
  List<String?>? phoneNumber;
  MultipartFile? photoUrl; // MultipartFile türünde olmalı
  String? birthday;
  String? addressDetail;
  String? emailDetail;

  CreatePersonRequestModel({
    this.fullName,
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
