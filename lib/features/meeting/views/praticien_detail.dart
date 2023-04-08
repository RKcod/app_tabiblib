import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/core/utils/utils.dart';
import 'package:tabiblib/features/meeting/views/take_meeting.dart';
import 'package:tabiblib/features/meeting/widgets/address_section.dart';
import 'package:tabiblib/features/meeting/widgets/other_section.dart';
import 'package:tabiblib/features/meeting/widgets/payment_section.dart';
import 'package:tabiblib/features/meeting/widgets/presentation_section.dart';
import 'package:tabiblib/features/meeting/widgets/sheets/experience_sheet.dart';
import 'package:tabiblib/features/meeting/widgets/sheets/formation_sheet.dart';
import 'package:tabiblib/features/meeting/widgets/sheets/hourly_sheet.dart';
import 'package:tabiblib/features/meeting/widgets/sheets/languages_sheet.dart';
import 'package:tabiblib/features/meeting/widgets/sheets/legal_informations_sheet.dart';
import 'package:tuple/tuple.dart';

class PraticienDetail extends StatefulWidget {
  const PraticienDetail({super.key});

  @override
  State<PraticienDetail> createState() => _PraticienDetailState();
}

class _PraticienDetailState extends State<PraticienDetail> {
  ScrollController controller = ScrollController();
  bool isCollapsed = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      isCollapsed = controller.offset >= 250;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var otherOptions = [
      Tuple3(Icons.schedule, "Horaires et contacts", () {
        showCustomBottomSheet(context,
            title: "Horaires et contacts", body: const HourlySheet());
      }),
      Tuple3(Icons.school_outlined, "Formations", () {
        showCustomBottomSheet(context,
            title: "Formations", body: const FormationSheet());
      }),
      Tuple3(Icons.speaker_notes_outlined, "Langues parlées", () {
        showCustomBottomSheet(context,
            title: "Langues parlées", body: const LanguagesSheet());
      }),
      Tuple3(Icons.description_outlined, "Expériences", () {
        showCustomBottomSheet(context,
            title: "Expériences", body: const ExperienceSheet());
      }),
      Tuple3(Icons.info_outline, "Informations légales", () {
        showCustomBottomSheet(context,
            title: "Informations légales",
            body: const LegalInformationsSheet());
      })
    ];
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Palette.primaryColor,
            title: isCollapsed
                ? const Text(
                    "DR le dentiste",
                    style: TextStyle(color: Colors.white),
                  )
                : null,
            leading: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
            actions: const [
              Icon(
                Icons.star_border,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              )
            ],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                width: double.infinity,
                height: double.infinity,
                color: Palette.secondaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 56,
                      backgroundImage: AssetImage("assets/images/doctor.png"),
                      backgroundColor: Palette.primaryColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Dr le dentiste",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    Text(
                      "Dentiste",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 44,
                      color: Palette.secondaryColor,
                    ),
                    Container(
                      width: double.infinity,
                      height: 28,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    )
                  ],
                ),
                Positioned(
                  top: 16,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomButton(
                      text: "PRENDRE RENDEZ-VOUS",
                      isFullWidth: true,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const TakeMeeting()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 8,
            ),
            const AddressSection(),
            const SizedBox(
              height: 16,
            ),
            const PresentationSection(),
            const SizedBox(
              height: 16,
            ),
            const PaymentSection(),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
              ),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => OtherSection(
                        icon: otherOptions[index].item1,
                        text: otherOptions[index].item2,
                        onPressed: otherOptions[index].item3,
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.black26,
                        height: 0,
                      ),
                  itemCount: otherOptions.length),
            )
          ])),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          )
        ],
      ),
    );
  }
}
