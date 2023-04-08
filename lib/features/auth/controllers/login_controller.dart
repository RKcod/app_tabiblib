import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_bottom_nav.dart';
import 'package:tabiblib/core/enums/enums.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/models/user_model.dart';

final loginControllerProvider = ChangeNotifierProvider((ref) {
  return LoginController(ref);
});

class LoginController extends ChangeNotifier {
  final Ref ref;
  LoginController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = false;
  bool rememberMe = true;

  void refresh() {
    notifyListeners();
  }

  toggleVisibilityPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void toggleRemember() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  void connect(BuildContext context) {
    ref.read(sharedPreferencesProvider).setString(
        "user",
        UserModel(
                name: "Mohamed",
                firstName: "Alzheimer",
                gender: Gender.female,
                email: emailController.text,
                password: passwordController.text,
                phone: "52462478",
                birthDay: DateTime.now())
            .toJson());
    // print(ref?.read(sharedPreferencesProvider).getString("user"));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CustomBottomNav()),
        (route) => false);
  }
}
