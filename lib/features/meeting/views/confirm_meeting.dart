import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/core/utils/utils.dart';
import 'package:tabiblib/features/meeting/widgets/select_radio_user.dart';
import 'package:tabiblib/features/settings/controllers/relatives_controller.dart';
import 'package:tabiblib/features/settings/widgets/edit_profile.dart';
import 'package:tabiblib/models/user_model.dart';

import '../../../core/providers/providers.dart';

class ConfirmMeeting extends ConsumerStatefulWidget {
  const ConfirmMeeting({super.key});

  @override
  ConsumerState<ConfirmMeeting> createState() => _ConfirmMeetingState();
}

class _ConfirmMeetingState extends ConsumerState<ConfirmMeeting> {
  late UserModel userSelected;

  @override
  void initState() {
    super.initState();

    var sharedPreferences = ref.read(sharedPreferencesProvider);
    userSelected = UserModel.fromJson(sharedPreferences.getString("user")!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var relativesController = ref.watch(relativesControllerProvider);
    var sharedPreferences = ref.watch(sharedPreferencesProvider);
    var userData = UserModel.fromJson(sharedPreferences.getString("user")!);

    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: const [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Palette.primaryColor,
                  backgroundImage: AssetImage("assets/images/doctor.png"),
                ),
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: Center(
                        child: Icon(
                      Icons.lock,
                      color: Palette.primaryColor,
                      size: 8,
                    )),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Mercredi 26 avril Avril - 11:15",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Ce créneau est pré-réservé pendant 15min",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                )
              ],
            )
          ],
        ),
        isLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pour qui prenez-vous ce rendez-vous ?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Un rendez-vous est pris pour une seule personne",
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => index == 0
                          ? SelectRadioUser(
                              value: userData,
                              groupValue: userSelected,
                              onChanged: (user) {
                                userSelected = user!;
                                setState(() {});
                              })
                          : SelectRadioUser(
                              value: relativesController.relatives[index - 1],
                              groupValue: userSelected,
                              onChanged: (user) {
                                userSelected = user!;
                                setState(() {});
                              }),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 12,
                          ),
                      itemCount: relativesController.relatives.length + 1),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomBottomSheet(context,
                          title: "Ajouter un proche",
                          customBuilder: (context, controller, state) =>
                              EditProfile(
                                scrollController: controller,
                                userData: UserModel.empty(),
                                onPressed: (data) => ref
                                    .read(relativesControllerProvider)
                                    .addRelative(data),
                              ));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person_add,
                          color: Palette.primaryColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Pour quelqu'un d'autre",
                          style: TextStyle(
                              color: Palette.primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  CustomButton(
                    text: "CONFIRMER LE RENDEZ-VOUS",
                    isFullWidth: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Palette.primaryColor.withOpacity(0.5)),
                      color: Palette.primaryColor.withOpacity(0.2),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.info,
                          color: Palette.primaryColor,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                            child: Text.rich(TextSpan(
                                text: "En confirmant ce rendez-vous, ",
                                style: TextStyle(color: Palette.primaryColor),
                                children: [
                              TextSpan(
                                  text: "vous vous engagez à l'honorer",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ])))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
