import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class PresentationSheet extends StatelessWidget {
  const PresentationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var skills = [
      "Alignement dentaire invisible",
      "Orthodontie pour adulte",
      "Orthodontie pédiatrique",
      "Orthopédie dento-faciale",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Minim ullamco et esse aliqua aliqua aliquip do sint cupida"
            "tat exercitation incididunt do enim deserunt. Consectetur ut irure culpa et"
            " veniam veniam. Labore Lorem aute voluptate reprehenderit. Cupidatat est consect",
            style: TextStyle(height: 1.8),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: const [
              Icon(
                Icons.science,
                size: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Expertises et actes",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
                skills.length,
                (index) => Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black26),
                      child: Text(skills[index]),
                    )),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: const [
              Icon(
                Icons.call_outlined,
                size: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Site web",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            child: const Text(
              "Voir le site",
              style: TextStyle(
                  color: Palette.primaryColor,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
