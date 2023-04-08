import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String firstButtonText;
  final void Function() firstButtonOnPressed;
  final String secondButtonText;
  final void Function() secondButtonOnPressed;
  const CustomDialog(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.firstButtonText,
      required this.firstButtonOnPressed,
      required this.secondButtonText,
      required this.secondButtonOnPressed});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, height: 1.2),
                ),
              ),
              CustomButton(
                text: firstButtonText,
                onPressed: firstButtonOnPressed,
                isFullWidth: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                text: secondButtonText,
                onPressed: secondButtonOnPressed,
                isFullWidth: true,
                transparent: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
