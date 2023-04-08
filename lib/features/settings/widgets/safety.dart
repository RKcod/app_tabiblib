import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Safety extends StatelessWidget {
  const Safety({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Palette.primaryColor.withOpacity(0.25),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.safety_check,
            color: Palette.primaryColor,
            size: 64,
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Votre santé. Vos données",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Le respect de la confidentialité de vos données est notre priorité absolue",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text(
                      "Découvrir nos engagements",
                      style: TextStyle(
                          color: Palette.primaryColor,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
