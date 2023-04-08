import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/core/utils/utils.dart';
import 'package:tabiblib/features/meeting/widgets/sheets/presentation_sheet.dart';

class PresentationSection extends StatelessWidget {
  const PresentationSection({super.key});

  @override
  Widget build(BuildContext context) {
    var skills = [
      "Alignement dentaire invisible",
      "Orthodontie pour adulte",
      "Orthodontie pédiatrique",
      "Orthopédie dento-faciale",
    ];

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person_outline,
                size: 16,
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "Présentation",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showCustomBottomSheet(context,
                      title: "Présentation", body: const PresentationSheet());
                },
                child: const Text(
                  "Voir plus",
                  style: TextStyle(
                      fontSize: 14,
                      color: Palette.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "Aliqua exercitation occaecat nulla cupidatat voluptate pariatur proident labore consequat "
              "veniam ullamco magna non sunt. Amet anim laborum commodo cupidatat sint commodo id adipisicing "
              "exercitation aute excepteur mollit dolore. Reprehenderit amet ex ipsum eiusmod irure ex "
              "labore sunt laborum.",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(height: 1.8),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
                skills.length <= 3 ? skills.length : 4,
                (index) => Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black26),
                      child: Text(index == 3
                          ? "+ ${skills.length - 3}"
                          : skills[index]),
                    )),
          )
        ],
      ),
    );
  }
}
