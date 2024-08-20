class UpdatePersonRequestModel {
  String? fullName;
  bool? isFavourite;
  List<String?>? phoneNumber;
  String? photoUrl;
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
  UpdatePersonRequestModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName']?.toString();
    isFavourite = json['isFavourite'];
    if (json['phoneNumber'] != null) {
      final v = json['phoneNumber'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      phoneNumber = arr0;
    }
    photoUrl = json['photoUrl']?.toString();
    birthday = json['birthday']?.toString();
    addressDetail = json['addressDetail']?.toString();
    emailDetail = json['emailDetail']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['isFavourite'] = isFavourite;
    if (phoneNumber != null) {
      final v = phoneNumber;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['phoneNumber'] = arr0;
    }
    data['photoUrl'] = photoUrl;
    data['birthday'] = birthday;
    data['addressDetail'] = addressDetail;
    data['emailDetail'] = emailDetail;
    return data;
  }
}
