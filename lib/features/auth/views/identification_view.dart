import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/views/login_view.dart';
import 'package:tabiblib/features/auth/views/sign_up_view.dart';
import 'package:tabiblib/features/auth/widgets/card_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IdentificationView extends StatelessWidget {
  const IdentificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.identification,
        isLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.identificationTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(
              height: 16,
            ),
            CardAuth(
                title: AppLocalizations.of(context)!.identificationSubtitle1,
                textButton: AppLocalizations.of(context)!.signUp,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpView()));
                },
                colorButton: Palette.primaryColor),
            const SizedBox(
              height: 24,
            ),
            CardAuth(
                title: AppLocalizations.of(context)!.identificationSubtitle2,
                textButton: AppLocalizations.of(context)!.signIn,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                },
                colorButton: Palette.thirdColor),
          ],
        ),
      ),
    );
  }
}
