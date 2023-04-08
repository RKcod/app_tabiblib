import 'dart:convert';

import 'package:tabiblib/core/enums/enums.dart';
import 'package:tabiblib/models/hive/user/user.dart';

class UserModel {
  final int? id;
  final String name;
  final String firstName;
  final Gender gender;
  final String email;
  final String password;
  final String phone;
  final DateTime birthDay;
  UserModel({
    this.id,
    required this.name,
    required this.firstName,
    required this.gender,
    required this.email,
    required this.password,
    required this.phone,
    required this.birthDay,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? firstName,
    Gender? gender,
    String? email,
    String? password,
    String? phone,
    DateTime? birthDay,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      birthDay: birthDay ?? this.birthDay,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'firstName': firstName,
      'gender': gender.name,
      'email': email,
      'password': password,
      'phone': phone,
      'birthDay': birthDay.millisecondsSinceEpoch,
    };
  }

  factory UserModel.empty() {
    return UserModel(
        name: "",
        firstName: "",
        gender: Gender.female,
        email: "",
        password: "",
        phone: "",
        birthDay: DateTime.now());
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      firstName: map['firstName'] ?? '',
      gender: Gender.values.where((value) => value.name == map['gender']).first,
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      phone: map['phone'] ?? '',
      birthDay: DateTime.fromMillisecondsSinceEpoch(map['birthDay']),
    );
  }

  factory UserModel.fromIsar(User user) {
    return UserModel(
      id: user.id,
      name: user.name ?? '',
      firstName: user.firstName ?? '',
      gender: user.gender ?? Gender.female,
      // gender: Gender.values.where((value) => value.name == user.gender).first,
      email: user.email ?? '',
      password: user.password ?? '',
      phone: user.phone ?? '',
      birthDay: DateTime.fromMillisecondsSinceEpoch(
          user.birthDay!.millisecondsSinceEpoch),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, firstName: $firstName, gender: $gender, email: $email, password: $password, phone: $phone, birthDay: $birthDay)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.firstName == firstName &&
        other.gender == gender &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.birthDay == birthDay;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        firstName.hashCode ^
        gender.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        birthDay.hashCode;
  }
}
