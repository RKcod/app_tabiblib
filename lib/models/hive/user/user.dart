import 'package:isar/isar.dart';
import 'package:tabiblib/core/enums/enums.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  String? name;

  String? firstName;

  @Enumerated(EnumType.name)
  Gender? gender;

  String? email;

  String? password;

  String? phone;

  DateTime? birthDay;
}
