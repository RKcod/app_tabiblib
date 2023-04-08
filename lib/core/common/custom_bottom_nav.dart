import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/documents/views/document_view.dart';
import 'package:tabiblib/features/home/views/home_view.dart';
import 'package:tabiblib/features/meeting/views/meeting_view.dart';
import 'package:tabiblib/features/settings/controllers/relatives_controller.dart';
import 'package:tabiblib/features/settings/views/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomNav extends ConsumerStatefulWidget {
  const CustomBottomNav({super.key});

  @override
  ConsumerState<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends ConsumerState<CustomBottomNav> {
  int currentIndex = 0;

  List<Widget> views = [
    const MeetingView(),
    const DocumentView(),
    const HomeView(),
    Scaffold(
      appBar: AppBar(
        title: const Text(
          "Antécédents",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Palette.primaryColor,
      ),
    ),
    const SettingsView()
  ];

  @override
  Widget build(BuildContext context) {
    var sharedPreferences = ref.watch(sharedPreferencesProvider);
    ref.read(relativesControllerProvider).initializeData();

    return Scaffold(
      body: views[currentIndex],
      bottomNavigationBar: BottomBarDivider(
        items: [
          TabItem(
              icon: Icons.calendar_month_outlined,
              title: AppLocalizations.of(context)!.meeting),
          TabItem(
              icon: Icons.receipt_long_outlined,
              title: AppLocalizations.of(context)!.document),
          TabItem(icon: Icons.home, title: AppLocalizations.of(context)!.home),
          const TabItem(icon: Icons.analytics, title: "Antécédents"),
          TabItem(
              icon: Icons.person,
              title: sharedPreferences.getString("user") != null
                  ? AppLocalizations.of(context)!.account
                  : AppLocalizations.of(context)!.connection)
        ],
        iconSize: 18,
        duration: const Duration(milliseconds: 350),
        backgroundColor: Colors.white,
        color: Colors.black87,
        colorSelected: Palette.primaryColor,
        titleStyle: const TextStyle(fontSize: 8.7),
        indexSelected: currentIndex,
        onTap: (int index) => setState(() {
          currentIndex = index;
        }),
        animated: true,
      ),
    );
  }
}
