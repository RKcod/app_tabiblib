import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tabiblib/core/common/custom_bottom_nav.dart';
import 'package:tabiblib/core/enums/enums.dart';
import 'package:tabiblib/core/extensions/string_extension.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/models/user_model.dart';

var signUpControllerProvider =
    ChangeNotifierProvider.autoDispose((ref) => SignUpController());

class SignUpController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var maskFormatterDate = MaskTextInputFormatter(
    mask: "##/##/####",
  );

  var maskFormatterCode = MaskTextInputFormatter(mask: "###");

  bool isError = false;
  bool isValid = false;
  int step = 1;
  Gender gender = Gender.female;

  bool isValidName = false;
  bool isValidFirstName = false;

  bool isErrorStepThree = false;
  bool isValidStepThree = false;
  bool showPassword = false;

  bool isErrorStepFour = false;
  bool isValidStepFour = false;

  bool acceptTerms = false;

  bool enableContinueStepOne = false;
  bool enableContinueStepTwo = false;
  bool enableContinueStepThree = false;
  bool enableContinueStepFour = false;
  bool enableContinueStepFive = false;

  void initControllers() {
    emailController.addListener(() {
      enableContinueStepOne = emailController.text.isNotEmpty;
      if (emailController.text.isNotEmpty) {
        isValid = emailController.text.isEmail();
        isError = !isValid;
      } else {
        isError = false;
        isValid = false;
      }
      notifyListeners();
    });
    nameController.addListener(() {
      verificationStepTwo();
      isValidName = nameController.text.trim().isNotEmpty;
      notifyListeners();
    });
    firstNameController.addListener(() {
      verificationStepTwo();
      isValidFirstName = firstNameController.text.trim().isNotEmpty;
      notifyListeners();
    });
    dateController.addListener(() {
      verificationStepTwo();
      notifyListeners();
    });

    passwordController.addListener(() {
      enableContinueStepThree = passwordController.text.length >= 8;
      if (passwordController.text.isNotEmpty) {
        isValidStepThree = passwordController.text.length >= 8;
        isErrorStepThree = !isValidStepThree;
      } else {
        isErrorStepThree = false;
        isValidStepThree = false;
      }
      notifyListeners();
    });

    phoneController.addListener(() {
      enableContinueStepFour =
          phoneController.text.isOnlyDigit && phoneController.text.length >= 8;
      if (phoneController.text.isNotEmpty) {
        isValidStepFour = phoneController.text.isOnlyDigit &&
            phoneController.text.length >= 8;
        isErrorStepFour = !isValidStepFour;
      } else {
        isErrorStepFour = false;
        isValidStepFour = false;
      }
      notifyListeners();
    });

    codeController.addListener(() {
      enableContinueStepFive = codeController.text.length == 3;
      notifyListeners();
    });
  }

  void changeGender(Gender value) {
    gender = value;
    notifyListeners();
  }

  set setFalseError(bool value) {
    isError = value;
    isErrorStepThree = value;
    notifyListeners();
  }

  void decreaseStep() {
    step--;
    notifyListeners();
  }

  void incrementStep() {
    step++;
    notifyListeners();
  }

  void verificationStepTwo() {
    enableContinueStepTwo = nameController.text.trim().isNotEmpty &&
        firstNameController.text.trim().isNotEmpty &&
        dateController.text.length == 10;
  }

  toggleVisibilityPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void toggleAcceptTerms() {
    acceptTerms = !acceptTerms;
    notifyListeners();
  }

// (emailPhoneController.text.isOnlyDigit &&
//             emailPhoneController.text.length >= 8)
  void continueStepOne() async {
    await Future.delayed(const Duration(seconds: 3));
    isValid = false;
    step++;

    notifyListeners();
  }

  void continueStepTwo() {
    isValidName = false;
    isValidFirstName = false;
    step++;
    notifyListeners();
  }

  void continueStepThree() {
    isValidStepThree = false;
    step++;
    notifyListeners();
  }

  void continueStepFour() {
    isValidStepFour = false;
    step++;
    notifyListeners();
  }

  void continueStepFive(BuildContext context, WidgetRef ref) {
    ref.read(sharedPreferencesProvider).setString(
        "user",
        UserModel(
                name: nameController.text,
                firstName: firstNameController.text,
                gender: gender,
                email: emailController.text,
                password: passwordController.text,
                phone: phoneController.text,
                birthDay: DateTime.now())
            .toJson());
    // print(ref?.read(sharedPreferencesProvider).getString("user"));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CustomBottomNav()),
        (route) => false);
  }
}
