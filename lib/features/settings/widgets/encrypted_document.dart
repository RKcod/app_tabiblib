import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class EncryptedDocument extends StatelessWidget {
  const EncryptedDocument({super.key});

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
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              "Grâce au chiffrement de bout en bout de vos documents, vous et vos médecins êtes les seuls à "
              "pouvoir accéder à vos documents.",
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
