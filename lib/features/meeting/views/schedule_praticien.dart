import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/accordion.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/meeting/views/confirm_meeting.dart';

class SchedulePraticien extends StatelessWidget {
  const SchedulePraticien({super.key});

  @override
  Widget build(BuildContext context) {
    var hourly = [
      ["Lundi", "08:00-15:00-18:00"],
      ["Mardi", "08:00-18:00"],
      ["Mercredi", "15:00-18:00"],
      ["Jeudi", "08:00-14:00-19:00"],
      ["Vendredi", "08:00-12:00-15:00-18:00"],
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Choisissez la date de consultation",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Accordion(
                      title: hourly[index][0],
                      textsCard: hourly[index][1].split("-"),
                      onPressedCard: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const ConfirmMeeting()));
                      },
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: 5),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                            color: Palette.primaryColor, width: 1.5))),
                child: const Text("AFFICHER PLUS DE DISPONIBILITÉ",
                    style: TextStyle(
                        color: Palette.primaryColor,
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
