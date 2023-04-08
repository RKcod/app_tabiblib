import 'package:flutter/material.dart';
import 'package:tabiblib/features/meeting/widgets/meeting_item.dart';

class SoonMeeting extends StatelessWidget {
  const SoonMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 64),
        itemBuilder: (context, index) => const MeetingItem(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
        itemCount: 5);
    // return const Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 16),
    //   child: Center(
    //     child: Subject(
    //       text: "Aucun rendez-vous à venir",
    //       subtitle: "Trouvez un praticien et prenez rendez-vous à tout moment",
    //       hasButton: false,
    //     ),
    //   ),
    // );
  }
}
