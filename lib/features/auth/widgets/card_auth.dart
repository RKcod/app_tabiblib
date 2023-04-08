import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_button.dart';

class CardAuth extends StatelessWidget {
  final String title;
  final String textButton;
  final void Function() onPressed;
  final Color colorButton;
  const CardAuth(
      {super.key,
      required this.title,
      required this.textButton,
      required this.onPressed,
      required this.colorButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onPressed: onPressed,
            text: textButton,
            color: colorButton,
            isFullWidth: true,
          )
        ],
      ),
    );
  }
}
