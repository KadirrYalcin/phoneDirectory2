import 'package:azlistview/azlistview.dart';
import 'package:hive/hive.dart';

part 'person_model.g.dart';

@HiveType(typeId: 0) // TypeId 0 olarak belirleniyor
class Person extends HiveObject with ISuspensionBean {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String number;

  @HiveField(3)
  String? secondNumber;

  @HiveField(4)
  String? email;

  Person({
    required this.id,
    required this.name,
    required this.number,
    this.secondNumber,
    this.email,
  });

  @override
  String getSuspensionTag() => name[0];
  int compareTo(Person other) {
    return name.toLowerCase().compareTo(other.name.toLowerCase());
  }
}
