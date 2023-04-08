import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/meeting/views/schedule_praticien.dart';

class TakeMeeting extends StatefulWidget {
  const TakeMeeting({super.key});

  @override
  State<TakeMeeting> createState() => _TakeMeetingState();
}

class _TakeMeetingState extends State<TakeMeeting> {
  var reasonsConsultation = [
    "Consultation de médecine esthétique",
    "Consultation de suivi de médecine esthétique",
    "Injection acide hyaluronique",
    "Injection botox",
    "Peeling",
    "Mésothérapie esthétique",
    "HydraFacial"
  ];
  var step = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (step == 1) {
          return true;
        } else {
          step--;
          setState(() {});
          return false;
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          titleWidget: Row(
            children: [
              const CircleAvatar(
                radius: 12,
                backgroundColor: Palette.primaryColor,
                backgroundImage: AssetImage("assets/images/doctor.png"),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Prenez rendez-vous",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Dr Borath Sar",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              )
            ],
          ),
          isLeading: true,
        ),
        body: step != 1
            ? const SchedulePraticien()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choisissez votre motif de consultation",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
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
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  step++;
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(reasonsConsultation[index]),
                                ),
                              ),
                          separatorBuilder: (context, index) => const Divider(
                                color: Colors.black26,
                                height: 0,
                              ),
                          itemCount: reasonsConsultation.length),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
