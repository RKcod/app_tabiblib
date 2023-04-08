import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_radio.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/enums/enums.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/settings/controllers/edit_profile_controller.dart';
import 'package:tabiblib/models/user_model.dart';

class EditProfile extends ConsumerStatefulWidget {
  final UserModel userData;
  final ScrollController scrollController;
  final int? idUser;
  final void Function(UserModel)? onPressed;
  const EditProfile({
    super.key,
    required this.scrollController,
    required this.userData,
    this.onPressed,
    this.idUser,
  });

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  @override
  void initState() {
    super.initState();

    ref.read(editProfileControllerProvider).initData(widget.userData);
  }

  @override
  Widget build(BuildContext context) {
    var editProfileController = ref.watch(editProfileControllerProvider);

    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(color: Palette.primaryColor.withOpacity(0.5)),
                  color: Palette.primaryColor.withOpacity(0.2),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: const [
                    Icon(
                      Icons.notifications,
                      color: Palette.primaryColor,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                        child: Text.rich(TextSpan(
                            text: "Vos ",
                            style: TextStyle(color: Palette.primaryColor),
                            children: [
                          TextSpan(
                              text: "informations d'identité",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: " doivent être "),
                          TextSpan(
                            text: "exactes et à jour.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  " Elles seront transmises à vos praticiens.")
                        ])))
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Identité",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CustomRadio(
                    value: Gender.female,
                    groupValue: editProfileController.gender,
                    text: "Féminin",
                    onChanged: (gender) {
                      editProfileController.changeGender(gender!);
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CustomRadio(
                    value: Gender.male,
                    groupValue: editProfileController.gender,
                    text: "Masculin",
                    onChanged: (gender) {
                      editProfileController.changeGender(gender!);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                title: "Prénom",
                hintText: "Prénom",
                initialText: widget.userData.firstName,
                isError: false,
                isValid: editProfileController.firstName.trim().isNotEmpty,
                coloredBorderError: false,
                onChanged: (value) {
                  editProfileController.firstName = value;
                  editProfileController.verificationStepTwo();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                title: "Nom",
                hintText: "Nom",
                initialText: widget.userData.name,
                isError: false,
                isValid: editProfileController.name.trim().isNotEmpty,
                coloredBorderError: false,
                onChanged: (value) {
                  editProfileController.name = value;
                  editProfileController.verificationStepTwo();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                title: "Date de naissance",
                hintText: "Date de naissance",
                keyboardType: TextInputType.number,
                isError: false,
                isValid: editProfileController.date.length == 10,
                coloredBorderError: false,
                onChanged: (value) {
                  editProfileController.date = value;
                  editProfileController.verificationStepTwo();
                },
                inputFormatters: [editProfileController.maskFormatter],
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                text: "ENREGISTRER",
                isFullWidth: true,
                onPressed: widget.onPressed == null
                    ? () {
                        ref.read(sharedPreferencesProvider).setString(
                            "user",
                            widget.userData
                                .copyWith(
                                    name: editProfileController.name,
                                    firstName: editProfileController.firstName,
                                    gender: editProfileController.gender)
                                .toJson());
                        ref.refresh(sharedPreferencesProvider);
                        Navigator.pop(context);
                      }
                    : () {
                        widget.onPressed!(UserModel.empty().copyWith(
                            id: widget.idUser,
                            name: editProfileController.name,
                            firstName: editProfileController.firstName,
                            gender: editProfileController.gender));
                        Navigator.pop(context);
                      },
                isDisabled: !editProfileController.enableSave,
              )
            ],
          ),
        ),
      ),
    );
  }
}
