import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/controllers/sign_up_controller.dart';
import 'package:tabiblib/features/auth/widgets/card_icon.dart';

class SignUpStepFour extends ConsumerWidget {
  const SignUpStepFour({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signUpController = ref.watch(signUpControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CardIcon(icon: Icons.call_outlined),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Text(
            "Entrez votre numéro de téléphone",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        CustomTextfield(
          controller: signUpController.phoneController,
          hintText: "Numéro de téléphone",
          isError: signUpController.isErrorStepFour,
          isValid: signUpController.isValidStepFour,
          keyboardType: TextInputType.number,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Pour confirmer ce numéro, nous allons vous envoyer un code à 3 chiffres par SMS. Ce numéro sera utilisé pour la double authentification et les rappels de vos rendez-vous.",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        Visibility(
            visible: signUpController.isErrorStepFour,
            child: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text("Le format du numéro de téléphone n'est pas reconnu"),
            )),
        const SizedBox(
          height: 32,
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
            ref.read(signUpControllerProvider).continueStepFour();
          },
          isDisabled: !signUpController.enableContinueStepFour,
          text: "CONTINUER",
          isFullWidth: true,
        )
      ],
    );
  }
}
