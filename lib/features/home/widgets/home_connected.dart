import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/meeting/widgets/meeting_item.dart';

class HomeConnected extends StatelessWidget {
  const HomeConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Prochaines disponibilités",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 90,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Dr xxx",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4, bottom: 8),
                            child: Text("Médecin"),
                          ),
                          Text("Dispo dans 15 min")
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 16,
                    ),
                itemCount: 5),
          ),
          const SizedBox(
            height: 32,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Prochains rendez-vous",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => const MeetingItem(),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
              itemCount: 5),
          const SizedBox(
            height: 32,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Mes praticiens favoris",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 64,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundColor: Palette.primaryColor,
                            backgroundImage:
                                AssetImage("assets/images/doctor.png"),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Dr xxx",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Text("Médecin"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 16,
                    ),
                itemCount: 5),
          )
        ],
      ),
    );
  }
}
