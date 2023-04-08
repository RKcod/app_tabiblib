import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/doctor.png",
            width: 250,
            height: 250,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Une communauté de praticiens pour vous accompagner",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
