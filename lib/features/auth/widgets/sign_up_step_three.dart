import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/controllers/sign_up_controller.dart';
import 'package:tabiblib/features/auth/widgets/card_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpStepThree extends ConsumerWidget {
  const SignUpStepThree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signUpController = ref.watch(signUpControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CardIcon(icon: Icons.lock_outline),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            AppLocalizations.of(context)!.enterPassword,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        CustomTextfield(
          controller: signUpController.passwordController,
          hintText: AppLocalizations.of(context)!.password,
          isError: signUpController.isErrorStepThree,
          isValid: signUpController.isValidStepThree,
          obscure: !signUpController.showPassword,
          seeEye: true,
          onSuffixTap: () {
            ref.read(signUpControllerProvider).toggleVisibilityPassword();
          },
        ),
        Visibility(
          visible: signUpController.isErrorStepThree,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              AppLocalizations.of(context)!.passwordError,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w500),
            ),
          ),
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
            ref.read(signUpControllerProvider).continueStepThree();
          },
          isDisabled: !signUpController.enableContinueStepThree,
          text: AppLocalizations.of(context)!.continues,
          isFullWidth: true,
        )
      ],
    );
  }
}
