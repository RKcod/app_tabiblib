import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/features/auth/controllers/sign_up_controller.dart';
import 'package:tabiblib/features/auth/widgets/sign_up_step_five.dart';
import 'package:tabiblib/features/auth/widgets/sign_up_step_four.dart';
import 'package:tabiblib/features/auth/widgets/sign_up_step_one.dart';
import 'package:tabiblib/features/auth/widgets/sign_up_step_three.dart';
import 'package:tabiblib/features/auth/widgets/sign_up_step_two.dart';
import 'package:tabiblib/features/auth/widgets/verify_phone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  @override
  void initState() {
    super.initState();

    ref.read(signUpControllerProvider).initControllers();
  }

  @override
  Widget build(BuildContext context) {
    var signUpController = ref.watch(signUpControllerProvider);

    return WillPopScope(
      onWillPop: () async {
        signUpController.isError = false;

        if (signUpController.step > 1) {
          signUpController.decreaseStep();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.signUp,
          isLeading: true,
          onPressedLeading: signUpController.step > 1
              ? () {
                  signUpController.decreaseStep();
                }
              : null,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: stepToShow(signUpController.step),
          ),
        ),
      ),
    );
  }

  Widget stepToShow(int step) {
    switch (step) {
      case 1:
        return const SignUpStepOne();
      case 2:
        return const SignUpStepTwo();
      case 3:
        return const SignUpStepThree();
      case 4:
        return const SignUpStepFour();
      case 5:
        return const VerifyPhone();
      case 6:
        return const SignUpStepFive();
      default:
        return const SizedBox();
    }
  }
}
