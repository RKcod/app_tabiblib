import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/core/utils/utils.dart';
import 'package:tabiblib/features/settings/controllers/relatives_controller.dart';
import 'package:tabiblib/features/settings/views/manage_relatives.dart';
import 'package:tabiblib/features/settings/widgets/edit_profile.dart';
import 'package:tabiblib/features/settings/widgets/user_card.dart';
import 'package:tabiblib/models/user_model.dart';

class ListRelatives extends ConsumerStatefulWidget {
  const ListRelatives({super.key});

  @override
  ConsumerState<ListRelatives> createState() => _ListRelativesState();
}

class _ListRelativesState extends ConsumerState<ListRelatives> {
  @override
  Widget build(BuildContext context) {
    var relativesController = ref.watch(relativesControllerProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Mes proches",
        isLeading: true,
      ),
      body: relativesController.relatives.isEmpty
          ? const Center(
              child: Text("Vous n'avez pas encore ajouté de proches"),
            )
          : ListView.separated(
              padding: const EdgeInsets.only(bottom: 72),
              itemBuilder: (context, index) => UserCard(
                    userData: relativesController.relatives[index],
                    onPressed: () {
                      showCustomBottomSheet(context,
                          title: "Modifier un proche",
                          customBuilder: (context, controller, state) =>
                              EditProfile(
                                idUser: relativesController.relatives[index].id,
                                scrollController: controller,
                                userData: relativesController.relatives[index],
                                onPressed: (data) => ref
                                    .read(relativesControllerProvider)
                                    .editRelative(data),
                              ));
                    },
                    bottom: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Divider(
                          color: Colors.black26,
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => ManageRelatives(
                                        relativesController
                                            .relatives[index].id!)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Gérer les droits d'accès",
                                  style: TextStyle(
                                      color: Palette.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Icon(Icons.keyboard_arrow_right)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              separatorBuilder: (context, _) => const SizedBox(
                    height: 16,
                  ),
              itemCount: relativesController.relatives.length),
      floatingActionButton: TextButton(
        onPressed: () {
          showCustomBottomSheet(context,
              title: "Ajouter un proche",
              customBuilder: (context, controller, state) => EditProfile(
                    scrollController: controller,
                    userData: UserModel.empty(),
                    onPressed: (data) =>
                        ref.read(relativesControllerProvider).addRelative(data),
                  ));
        },
        style: TextButton.styleFrom(
            backgroundColor: Palette.primaryColor,
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              "Ajouter un proche",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
