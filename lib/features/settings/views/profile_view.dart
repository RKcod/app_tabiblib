import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/common/custom_card.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/features/settings/views/list_relatives.dart';
import 'package:tabiblib/features/settings/widgets/user_card.dart';
import 'package:tabiblib/models/user_model.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sharedPreferences = ref.watch(sharedPreferencesProvider);
    var userData = UserModel.fromJson(sharedPreferences.getString("user")!);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Mon profil",
        isLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            UserCard(
              userData: userData,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomCard(
              image: "assets/images/profil.png",
              title: "Le saviez-vous ?",
              subtitle:
                  "Vous pouvez aussi prendre des rendez-vous pour vos proches en leur créant des profils dédiées.",
              textButton: "Gérer mes proches",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const ListRelatives()));
              },
            )
          ],
        ),
      ),
    );
  }
}
