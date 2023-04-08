import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/common/custom_tile.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/meeting/views/praticien_detail.dart';
import 'package:tabiblib/features/meeting/widgets/important_informations_meeting.dart';
import 'package:tabiblib/features/meeting/widgets/order_praticien.dart';
import 'package:tabiblib/features/meeting/widgets/row_praticien.dart';

class InformationsMeeting extends StatelessWidget {
  const InformationsMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Informations du rendez-vous",
        isLeading: true,
        trailing: Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(
            Icons.share_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 42, bottom: 24),
              child: Column(
                children: [
                  Container(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            const PraticienDetail()));
                              },
                              child: const RowPraticien()),
                        ),
                        const Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.redAccent,
                                ),
                              ),
                              Text("ANNULER LE RDV",
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const OrderPraticien(),
                  const SizedBox(
                    height: 24,
                  ),
                  const ImportantInformationsMeeting(),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        const CustomTile(
                          icon: Icons.note,
                          text: "Créer une note",
                        ),
                        const Divider(
                          height: 0,
                          color: Colors.black26,
                        ),
                        CustomTile(
                          icon: Icons.history_edu_outlined,
                          text: "Retourner sur la fiche de Dr Carmen DARA",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        const PraticienDetail()));
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Palette.secondaryColor,
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text("Samedi 25 mars", style: TextStyle(color: Colors.white)),
                SizedBox(
                  width: 24,
                ),
                Icon(
                  Icons.schedule,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text("11:00", style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
