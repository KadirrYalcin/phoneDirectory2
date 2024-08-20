import 'package:azlistview/azlistview.dart';

class PersonResponseModel extends ISuspensionBean {
  int? id;
  String? fullName;
  String? birthday;
  bool? isFavourite;
  List<String?>? phoneNumber;
  String? photoUrl;
  String? addressDetail;
  String? emailDetail;

  PersonResponseModel({
    this.id,
    this.fullName,
    this.birthday,
    this.isFavourite,
    this.phoneNumber,
    this.photoUrl,
    this.addressDetail,
    this.emailDetail,
  });
  PersonResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    fullName = json['fullName']?.toString();
    birthday = json['birthday']?.toString();
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
    addressDetail = json['addressDetail']?.toString();
    emailDetail = json['emailDetail']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['birthday'] = birthday;
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
    data['addressDetail'] = addressDetail;
    data['emailDetail'] = emailDetail;
    return data;
  }

  @override
  String getSuspensionTag() => fullName![0];
  int compareTo(PersonResponseModel other) {
    return fullName!.toLowerCase().compareTo(other.fullName!.toLowerCase());
  }
}
