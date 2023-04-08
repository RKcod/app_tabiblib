import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/settings/controllers/relatives_controller.dart';

class ManageRelatives extends ConsumerWidget {
  final int idRelative;
  const ManageRelatives(this.idRelative, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var rights = [
      ["Réserver, consulter, modifier et annuler ", "tous les rendez-vous"],
      ["Ajouter, gérer et consulter ", "tous les documents"],
      ["Envoyer et recevoir ", "tous les messages"],
      ["Mettre à jour son identité et ses coordonnées", ""]
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Gérer les droits d'accès",
        isLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Droits d'accès pour Idriss CHIFO",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Droits complets",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Icon(
                                    Icons.check,
                                    color: Palette.primaryColor,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Text.rich(TextSpan(
                                      text: rights[index][0],
                                      style: const TextStyle(height: 1.8),
                                      children: [
                                        TextSpan(
                                            text: rights[index][1],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                )
                              ],
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 8,
                            ),
                        itemCount: rights.length),
                  )
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  ref
                      .read(relativesControllerProvider)
                      .removeRelative(idRelative);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: const Text("RETIRER CE PROCHE",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
