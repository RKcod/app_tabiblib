import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/controllers/sign_up_controller.dart';
import 'package:tabiblib/features/auth/widgets/card_icon.dart';

class SignUpStepFive extends ConsumerWidget {
  const SignUpStepFive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signUpController = ref.watch(signUpControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CardIcon(icon: Icons.policy),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Text(
            "Conditions d'utilisation et Politique de protection des données personnelles",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Pour créer un compte Tabiblib, veillez accepter les conditions d'utilisation",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                    value: signUpController.acceptTerms,
                    onChanged: (_) {
                      ref.read(signUpControllerProvider).toggleAcceptTerms();
                    },
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Palette.primaryColor;
                      }
                      return Colors.black26;
                    })),
              ),
              const SizedBox(
                width: 16,
              ),
              const Expanded(
                  child:
                      Text("J'ai lu et accepté les Conditions d'utilisation"))
            ],
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
            ref.read(signUpControllerProvider).continueStepFive(context, ref);
          },
          isDisabled: !signUpController.acceptTerms,
          text: "CONTINUER",
          isFullWidth: true,
        )
      ],
    );
  }
}
