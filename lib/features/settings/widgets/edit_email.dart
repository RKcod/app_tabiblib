import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/models/user_model.dart';

class EditEmail extends ConsumerStatefulWidget {
  final String initialEmail;
  const EditEmail({super.key, required this.initialEmail});

  @override
  ConsumerState<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends ConsumerState<EditEmail> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController(text: widget.initialEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextfield(
            controller: emailController,
            hintText: "Email",
            isError: false,
            isValid: false,
            onChanged: (_) {
              setState(() {});
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CustomButton(
            text: "ENREGISTRER",
            isFullWidth: true,
            isDisabled: emailController.text.isEmpty,
            onPressed: () {
              var sharedPreferences = ref.read(sharedPreferencesProvider);
              var user =
                  UserModel.fromJson(sharedPreferences.getString("user")!);
              sharedPreferences.setString(
                  "user", user.copyWith(email: emailController.text).toJson());
              ref.refresh(sharedPreferencesProvider);

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
