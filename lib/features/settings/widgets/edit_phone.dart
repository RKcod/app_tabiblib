import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/models/user_model.dart';

class EditPhone extends ConsumerStatefulWidget {
  final String initialPhone;
  const EditPhone({super.key, required this.initialPhone});

  @override
  ConsumerState<EditPhone> createState() => _EditPhoneState();
}

class _EditPhoneState extends ConsumerState<EditPhone> {
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    phoneController = TextEditingController(text: widget.initialPhone);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextfield(
            controller: phoneController,
            hintText: "Numéro de téléphone",
            isError: false,
            isValid: false,
            keyboardType: TextInputType.number,
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
            isDisabled: phoneController.text.isEmpty,
            onPressed: () {
              var sharedPreferences = ref.read(sharedPreferencesProvider);
              var user =
                  UserModel.fromJson(sharedPreferences.getString("user")!);
              sharedPreferences.setString(
                  "user", user.copyWith(phone: phoneController.text).toJson());
              ref.refresh(sharedPreferencesProvider);

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
