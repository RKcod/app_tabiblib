import 'package:flutter/material.dart';
import 'package:tabiblib/features/home/widgets/subject.dart';

class PastMeeting extends StatelessWidget {
  const PastMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Subject(
          text: "L'affichage de l'historique des rendez-vous est désactivée",
          assetImage: "assets/images/home_image.png",
          subtitle:
              "Nous avons besoin de votre autorisation pour afficher l'historique",
          textButton: "MODIFIER MES PREFERENCES",
        ),
      ),
    );
  }
}
