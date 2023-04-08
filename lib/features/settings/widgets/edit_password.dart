import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/models/user_model.dart';

class EditPassword extends ConsumerStatefulWidget {
  const EditPassword({
    super.key,
  });

  @override
  ConsumerState<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends ConsumerState<EditPassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  bool showOldPassword = false;
  bool showNewPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextfield(
            controller: oldPasswordController,
            title: "Ancien mot de passe",
            hintText: "",
            isError: false,
            isValid: false,
            obscure: showOldPassword,
            seeEye: true,
            onChanged: (_) {
              setState(() {});
            },
            onSuffixTap: () {
              setState(() {
                showOldPassword = !showOldPassword;
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextfield(
            controller: newPasswordController,
            title: "Nouveau mot de passe",
            hintText: "",
            isError: false,
            isValid: false,
            obscure: showNewPassword,
            seeEye: true,
            onChanged: (_) {
              setState(() {});
            },
            onSuffixTap: () {
              setState(() {
                showNewPassword = !showNewPassword;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8, top: 24),
            child: Text(
              "Votre mot de passe vous permettra de gérer vos rendez-vous médicaux",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          CustomButton(
            text: "ENREGISTRER",
            isFullWidth: true,
            isDisabled: oldPasswordController.text.length < 8 ||
                newPasswordController.text.length < 8,
            onPressed: () {
              var sharedPreferences = ref.read(sharedPreferencesProvider);
              var user =
                  UserModel.fromJson(sharedPreferences.getString("user")!);
              sharedPreferences.setString("user",
                  user.copyWith(password: newPasswordController.text).toJson());
              ref.refresh(sharedPreferencesProvider);

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
