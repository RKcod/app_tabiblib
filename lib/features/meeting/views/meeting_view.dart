import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/views/identification_view.dart';
import 'package:tabiblib/features/home/widgets/subject.dart';
import 'package:tabiblib/features/meeting/views/search_praticien.dart';
import 'package:tabiblib/features/meeting/widgets/past_meeting.dart';
import 'package:tabiblib/features/meeting/widgets/soon_meeting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MeetingView extends ConsumerWidget {
  const MeetingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sharedPreferences = ref.watch(sharedPreferencesProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.myMeetings,
          height: sharedPreferences.getString("user") == null ? 56 : 100,
          bottom: sharedPreferences.getString("user") == null
              ? null
              : TabBar(
                  labelStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  indicatorColor: Colors.white,
                  tabs: [
                      Tab(
                        text: AppLocalizations.of(context)!.coming,
                      ),
                      Tab(
                        text: AppLocalizations.of(context)!.past,
                      )
                    ]),
        ),
        body: sharedPreferences.getString("user") == null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Center(
                  child: Subject(
                      text: AppLocalizations.of(context)!.scheduleMeeting,
                      assetImage: "assets/images/home_image.png",
                      subtitle: AppLocalizations.of(context)!
                          .scheduleMeetingDescription,
                      textButton: AppLocalizations.of(context)!.signIn,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    const IdentificationView()));
                      }),
                ),
              )
            : const TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [SoonMeeting(), PastMeeting()]),
        floatingActionButton: sharedPreferences.getString("user") == null
            ? null
            : TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SearchPraticien()));
                },
                style: TextButton.styleFrom(
                    backgroundColor: Palette.primaryColor,
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      AppLocalizations.of(context)!.makeAppointment,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
