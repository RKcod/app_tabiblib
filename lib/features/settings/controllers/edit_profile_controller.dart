import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tabiblib/core/enums/enums.dart';
import 'package:tabiblib/models/user_model.dart';

var editProfileControllerProvider =
    ChangeNotifierProvider.autoDispose((ref) => EditProfileController());

class EditProfileController extends ChangeNotifier {
  String firstName = "";
  String name = "";
  String date = "";
  Gender gender = Gender.female;

  void initData(UserModel user) {
    firstName = user.firstName;
    name = user.name;
    date = "";
    gender = user.gender;

    Future.delayed(const Duration(seconds: 1), () {
      notifyListeners();
    });
  }

  bool enableSave = false;

  set setName(String value) {
    name = value;
    notifyListeners();
  }

  set setFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  set setDate(String value) {
    date = value;
    notifyListeners();
  }

  var maskFormatter = MaskTextInputFormatter(
    mask: "##/##/####",
  );

  void changeGender(Gender value) {
    gender = value;
    notifyListeners();
  }

  void verificationStepTwo() {
    enableSave = name.trim().isNotEmpty &&
        firstName.trim().isNotEmpty &&
        date.length == 10;
    notifyListeners();
  }
}
