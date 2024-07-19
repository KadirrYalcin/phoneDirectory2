class User {
  final String name;
  final String tag;
  final String phone;

  User({required this.name, required this.tag, required this.phone});
  // Modeli JSON formatına dönüştüren fonksiyon
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'tag': tag,
      'phone': phone,
    };
  }
}
