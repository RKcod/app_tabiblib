import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/extensions/string_extension.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/meeting/views/informations_meeting.dart';
import 'package:tabiblib/features/meeting/widgets/row_praticien.dart';
import 'package:tabiblib/models/user_model.dart';

class MeetingItem extends ConsumerWidget {
  const MeetingItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sharedPreferences = ref.watch(sharedPreferencesProvider);
    var userData = UserModel.fromJson(sharedPreferences.getString("user")!);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
                color: Palette.secondaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
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
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const InformationsMeeting()));
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const RowPraticien(),
            ),
          ),
          const Divider(
            height: 0,
            color: Colors.black26,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(
                  width: 16,
                ),
                Text(
                    "${userData.firstName.capitalize()} ${userData.name.toUpperCase()}")
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: Colors.black26,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const InformationsMeeting()));
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: const [
                  Icon(
                    Icons.receipt_long,
                    color: Palette.primaryColor,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Préparez la préparation",
                    style: TextStyle(color: Palette.primaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
