import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_button.dart';

class Subject extends StatelessWidget {
  final String text;
  final String subtitle;
  final String textButton;
  final void Function()? onPressed;
  final bool hasButton;
  final String assetImage;
  const Subject(
      {super.key,
      required this.text,
      required this.subtitle,
      this.textButton = "",
      this.onPressed,
      this.hasButton = true,
      required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          assetImage,
          height: 200,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black38),
        ),
        Visibility(
          visible: hasButton,
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: CustomButton(onPressed: onPressed, text: textButton),
          ),
        ),
      ],
    );
  }
}
