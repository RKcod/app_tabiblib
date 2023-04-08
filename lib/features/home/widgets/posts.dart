import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    var carouselTexts = [
      AppLocalizations.of(context)!.carouselText1,
      AppLocalizations.of(context)!.carouselText2,
      AppLocalizations.of(context)!.carouselText3,
      AppLocalizations.of(context)!.carouselText4
    ];

    var images = [
      "assets/images/carousel1.png",
      "assets/images/carousel2.png",
      "assets/images/carousel3.png",
      "assets/images/carousel4.png"
    ];

    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) =>
          Consumer(builder: (context, ref, child) {
        ref.watch(localeProvider);
        return Container(
          width: 480,
          height: 50,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Palette.secondaryColor,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  carouselTexts[index],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Image.asset(
                images[index],
                width: 100,
                height: 100,
              )
            ],
          ),
        );
      }),
      itemCount: 4,
      options: CarouselOptions(
        height: 140,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 8),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
