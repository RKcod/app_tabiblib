import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/views/identification_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Palette.primaryColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.safety_check,
                  color: Palette.primaryColor,
                  size: 48,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      AppLocalizations.of(context)!.messageCardConnection,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const IdentificationView()));
              },
              text: AppLocalizations.of(context)!.signIn,
              isFullWidth: true,
            )
          ],
        ));
  }
}
