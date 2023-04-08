import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/controllers/sign_up_controller.dart';
import 'package:tabiblib/features/auth/widgets/card_icon.dart';

class VerifyPhone extends ConsumerWidget {
  const VerifyPhone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signUpController = ref.watch(signUpControllerProvider);

    return Column(
      children: [
        const CardIcon(icon: Icons.phone_outlined),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              "Saisissez le code que nous vous avons envoyé par SMS",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        CustomTextfield(
          controller: signUpController.codeController,
          hintText: "Code de vérification à 3 chiffres",
          isError: false,
          isValid: false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            signUpController.maskFormatterCode
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
              "Nous avons envoyé un SMS au ${signUpController.phoneController.text}"),
        ),
        const Text(
          "Vous n'avez pas reçu de SMS ?",
          style: TextStyle(color: Palette.primaryColor),
        ),
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
            ref.read(signUpControllerProvider).incrementStep();
          },
          isDisabled: !signUpController.enableContinueStepFive,
          text: "CONTINUER",
          isFullWidth: true,
        )
      ],
    );
  }
}
