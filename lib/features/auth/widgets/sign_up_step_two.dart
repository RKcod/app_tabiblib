import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_radio.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/enums/enums.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/controllers/sign_up_controller.dart';
import 'package:tabiblib/features/auth/widgets/card_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpStepTwo extends ConsumerWidget {
  const SignUpStepTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signUpController = ref.watch(signUpControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CardIcon(icon: Icons.person),
            const SizedBox(
              width: 16,
            ),
            Text(
              signUpController.emailController.text,
              style: const TextStyle(color: Colors.black54),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            AppLocalizations.of(context)!.informIdentity,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            AppLocalizations.of(context)!.identity,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: [
            CustomRadio(
              value: Gender.female,
              groupValue: signUpController.gender,
              text: AppLocalizations.of(context)!.female,
              onChanged: (gender) {
                signUpController.changeGender(gender!);
              },
            ),
            const SizedBox(
              width: 16,
            ),
            CustomRadio(
              value: Gender.male,
              groupValue: signUpController.gender,
              text: AppLocalizations.of(context)!.male,
              onChanged: (gender) {
                signUpController.changeGender(gender!);
              },
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: CustomTextfield(
            controller: signUpController.nameController,
            isError: false,
            isValid: signUpController.isValidName,
            hintText: AppLocalizations.of(context)!.name,
          ),
        ),
        CustomTextfield(
          controller: signUpController.firstNameController,
          isError: false,
          isValid: signUpController.isValidFirstName,
          hintText: AppLocalizations.of(context)!.firstName,
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            AppLocalizations.of(context)!.birthDay,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        CustomTextfield(
          controller: signUpController.dateController,
          isError: false,
          isValid: false,
          hintText: "JJ/MM/AAAA",
          inputFormatters: [signUpController.maskFormatterDate],
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 24,
        ),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          percent: signUpController.step / 6,
          linearGradient: LinearGradient(colors: [
            Palette.primaryColor.withOpacity(0.4),
            Palette.primaryColor
          ], stops: const [
            0.5,
            1
          ]),
          barRadius: const Radius.circular(8),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          onPressed: () {
            ref.read(signUpControllerProvider).continueStepTwo();
          },
          isDisabled: !signUpController.enableContinueStepTwo,
          text: AppLocalizations.of(context)!.continues,
          isFullWidth: true,
        )
      ],
    );
  }
}
