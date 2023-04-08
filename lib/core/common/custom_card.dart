import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final String image;
  final String subtitle;
  final String textButton;
  final void Function()? onPressed;
  const CustomCard(
      {super.key,
      this.title,
      this.image = "assets/images/doctor.png",
      required this.subtitle,
      required this.textButton,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 200,
            height: 200,
          ),
          const SizedBox(
            height: 24,
          ),
          Visibility(
            visible: title != null,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  title ?? "",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32,
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(textButton,
                style: const TextStyle(
                    color: Palette.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
