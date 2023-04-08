import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/extensions/string_extension.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/views/identification_view.dart';
import 'package:tabiblib/features/home/widgets/posts.dart';
import 'package:tabiblib/features/meeting/views/search_praticien.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Header extends ConsumerStatefulWidget {
  const Header({super.key});

  @override
  ConsumerState<Header> createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<Header> {
  List<String> postsTextValueAnimated = [];
  int postsIndexText = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (postsIndexText < postsTextValueAnimated.length - 1) {
        postsIndexText++;
      } else {
        postsIndexText = 0;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  List<DropdownMenuItem<String>> itemDropdown({Color? color}) {
    return ["Fr", "Ar"]
        .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: TextStyle(fontSize: 14, color: color),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    postsTextValueAnimated = [
      AppLocalizations.of(context)!.osteopath,
      AppLocalizations.of(context)!.physiotherapist,
      AppLocalizations.of(context)!.midwife,
      AppLocalizations.of(context)!.psychologist,
      AppLocalizations.of(context)!.laboratory,
      AppLocalizations.of(context)!.pharmacy,
      AppLocalizations.of(context)!.generalPraticien,
      AppLocalizations.of(context)!.ophthalmologist,
      AppLocalizations.of(context)!.dentist,
      AppLocalizations.of(context)!.radiologist
    ];

    var sharedPreferences = ref.watch(sharedPreferencesProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Palette.primaryColor,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 64,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                items: itemDropdown(),
                                value: ref
                                    .watch(localeProvider)
                                    ?.languageCode
                                    .capitalize(),
                                isExpanded: true,
                                focusColor: Colors.white,
                                selectedItemBuilder: (context) =>
                                    itemDropdown(color: Colors.white),
                                onChanged: (locale) {
                                  ref.read(localeProvider.notifier).state =
                                      Locale(locale!.toLowerCase());
                                  ref.read(sharedPreferencesProvider).setString(
                                      "locale", locale.toLowerCase());
                                },
                                icon: const Icon(
                                  Icons.expand_more,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sharedPreferences.getString("user") == null
                        ? TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) =>
                                          const IdentificationView()));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.signIn,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ))
                        : const SizedBox()
                  ],
                ),
              ),
              Image.asset(
                "assets/logo.png",
                width: 100,
              )
            ],
          ),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              AppLocalizations.of(context)!.makeAppointmentWithProfessional,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0, -1), end: const Offset(0, 0))
                    .animate(animation),
                child: child,
              ),
            ),
            child: Text(
              postsTextValueAnimated[postsIndexText],
              key: ValueKey(postsIndexText),
              style: const TextStyle(
                  color: Palette.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SearchPraticien()));
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.searchText,
                      style: const TextStyle(color: Palette.primaryColor),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.search,
                      color: Palette.primaryColor,
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 32,
          ),
          const Posts()
        ],
      ),
    );
  }
}
