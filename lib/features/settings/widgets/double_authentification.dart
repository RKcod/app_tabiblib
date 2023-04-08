import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class DoubleAuthentification extends StatelessWidget {
  const DoubleAuthentification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          Image.asset(
            "assets/images/doctor.png",
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "La sécurité au-delà du mot de passe",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "Un code de vérification vous est envoyé par email ou SMS lors d'une connexion depuis un nouvel appareil.",
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.6),
            ),
          ),
          const Text(
            "En savoir plus",
            style: TextStyle(color: Palette.primaryColor, fontSize: 13),
          )
        ],
      ),
    );
  }
}
