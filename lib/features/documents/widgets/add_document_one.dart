import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_icon_button.dart';
import 'package:tabiblib/features/documents/controllers/document_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tabiblib/features/documents/widgets/add_document_two.dart';

class AddDocumentOne extends ConsumerWidget {
  const AddDocumentOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var documentController = ref.watch(documentControllerProvider);

    return documentController.step == 1
        ? Column(
            children: [
              SizedBox(
                height: 150,
                child: CarouselSlider.builder(
                  itemCount: documentController.filePaths.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: itemIndex ==
                                  documentController.filePaths.length - 1
                              ? 0
                              : 8),
                      child: Image.file(
                        File(documentController.filePaths[itemIndex]),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                      onPageChanged: (index, reason) =>
                          documentController.changeIndex(index),
                      enableInfiniteScroll: false,
                      viewportFraction: 0.85,
                      disableCenter: true,
                      aspectRatio: 2),
                ),
              ),
              const Spacer(),
              Text(
                "PAGE ${documentController.indexPageView + 1}/${documentController.filePaths.length}",
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      icon: Icons.add,
                      onPressed: documentController.addPage,
                      text: "Nouvelle page",
                    ),
                    CustomIconButton(
                      icon: Icons.delete,
                      onPressed: () => documentController.deletePage(context),
                      text: "Supprimer",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                text: "CONTINUER",
                isFullWidth: true,
                onPressed: () => documentController.changeStep(2),
              )
            ],
          )
        : const AddDocumentTwo();
  }
}
