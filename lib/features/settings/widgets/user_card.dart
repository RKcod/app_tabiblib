import "package:flutter/material.dart";
import "package:tabiblib/core/extensions/string_extension.dart";
import "package:tabiblib/core/utils/palette.dart";
import "package:tabiblib/core/utils/utils.dart";
import "package:tabiblib/features/settings/widgets/edit_profile.dart";
import "package:tabiblib/models/user_model.dart";

class UserCard extends StatelessWidget {
  final UserModel userData;
  final void Function()? onPressed;
  final Widget? bottom;
  const UserCard(
      {super.key, required this.userData, this.onPressed, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: userData.firstName.colorAvatar(),
                      child: Center(
                        child: Text(
                          "${userData.firstName[0]}${userData.name[0]}"
                              .toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: onPressed ??
                            () {
                              showCustomBottomSheet(context,
                                  title: "Modifier mon profil",
                                  customBuilder: (context, controller, state) =>
                                      EditProfile(
                                        scrollController: controller,
                                        userData: userData,
                                      ));
                            },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.edit,
                              color: Palette.primaryColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "MODIFIER",
                              style: TextStyle(
                                  color: Palette.primaryColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "${userData.firstName.capitalize()} ${userData.name.toUpperCase()}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Né le 26/08/2000",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          bottom != null ? bottom! : const SizedBox()
        ],
      ),
    );
  }
}
