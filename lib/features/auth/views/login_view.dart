import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/controllers/login_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginController = ref.watch(loginControllerProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.signIn,
        isLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              controller: loginController.emailController,
              title: AppLocalizations.of(context)!.email,
              hintText: AppLocalizations.of(context)!.email,
              isError: false,
              isValid: false,
              onChanged: (_) {
                loginController.refresh();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextfield(
              controller: loginController.passwordController,
              title: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.password,
              isError: false,
              isValid: false,
              obscure: !loginController.showPassword,
              seeEye: true,
              onSuffixTap: () {
                ref.read(loginControllerProvider).toggleVisibilityPassword();
              },
              onChanged: (_) {
                loginController.refresh();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                      value: loginController.rememberMe,
                      onChanged: (_) {
                        ref.read(loginControllerProvider).toggleRemember();
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
                Expanded(
                    child: Text(
                        AppLocalizations.of(context)!.rememberIdentifiant)),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context)!.forgetPassword,
              style: const TextStyle(
                  color: Palette.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              text: AppLocalizations.of(context)!.continues,
              onPressed: () =>
                  ref.read(loginControllerProvider).connect(context),
              isFullWidth: true,
              isDisabled: loginController.emailController.text.isEmpty ||
                  loginController.passwordController.text.isEmpty,
            )
          ],
        ),
      ),
    );
  }
}
