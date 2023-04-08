import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_card.dart';

class MyPraticiens extends StatelessWidget {
  final bool centerTitle;
  const MyPraticiens({super.key, this.centerTitle = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
            child: const Text(
              "Mes praticiens",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          const Text(
            "Historique",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
          const SizedBox(
            height: 32,
          ),
          const CustomCard(
              subtitle:
                  "Vous pouvez maintenant décider si vous souhaitez afficher l'historique de vos praticiens sur la page d’accueil",
              textButton: "GÉRER LES PREFERENCES")
        ],
      ),
    );
  }
}
