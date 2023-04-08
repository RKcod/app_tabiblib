import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:tabiblib/core/common/custom_dialog.dart';
import 'package:tabiblib/core/common/custom_header_sheet.dart';
import 'package:tabiblib/core/extensions/context_extension.dart';
import 'package:tabiblib/features/documents/widgets/add_document_one.dart';

var documentControllerProvider =
    ChangeNotifierProvider((ref) => DocumentController());

class DocumentController extends ChangeNotifier {
  List<String> filePaths = [];
  int step = 1;
  int indexPageView = 0;
  BuildContext? contextSheet;

  TextEditingController nameDocumentController = TextEditingController();
  String? typeDocument;

  void changeIndex(int value) {
    indexPageView = value;
    notifyListeners();
  }

  void changeStep(int value) {
    step = value;
    notifyListeners();
  }

  void changeTypeDocument(String value) {
    typeDocument = value;
    notifyListeners();
  }

  void addDocument(BuildContext context) async {
    contextSheet = context;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      var path = result.files.single.path!;
      filePaths.add(path);
      notifyListeners();

      if (context.mounted) {
        showSlidingBottomSheet(context,
            builder: (builder) => SlidingSheetDialog(
                isDismissable: false,
                onDismissPrevented: (backButton, backDrop) {
                  if (step == 2 && backButton) {
                    step = 1;
                    notifyListeners();
                  } else {
                    exitWithoutSave(context);
                  }
                },
                avoidStatusBar: true,
                duration: const Duration(milliseconds: 500),
                snapSpec: const SnapSpec(snappings: [0, 1]),
                headerBuilder: (context, state) => Material(
                      color: Colors.transparent,
                      child: CustomHeaderSheet(
                        title: "Ajout d'un document",
                        additionalActionOnPressed: () =>
                            exitWithoutSave(context),
                      ),
                    ),
                customBuilder: (context, controller, state) => Material(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Container(
                            height: context.heightWithoutPadding - 48,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: const AddDocumentOne()),
                      ),
                    ))).then((_) {
          filePaths.clear();
          notifyListeners();
        });
      }
    }
  }

  void addPage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && !filePaths.contains(result.files.single.path!)) {
      filePaths.insert(indexPageView + 1, result.files.single.path!);
      notifyListeners();
    }
  }

  void deletePage(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (builder) => CustomDialog(
            title: "Supprimer la page",
            subtitle: "Cette page sera définitivement supprimée",
            firstButtonText: "CONFIRMER",
            firstButtonOnPressed: () {
              filePaths.removeAt(indexPageView);
              if (indexPageView > 1) {
                indexPageView--;
              }
              notifyListeners();

              Navigator.pop(context);
              if (filePaths.isEmpty) {
                Navigator.pop(contextSheet!);
              }
            },
            secondButtonText: "ANNULER",
            secondButtonOnPressed: () {
              Navigator.pop(context);
            }));
  }

  void exitWithoutSave(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (builder) => CustomDialog(
            title: "Quitter sans sauvegarder",
            subtitle: "Votre document ne sera pas sauvegardé",
            firstButtonText: "QUITTER",
            firstButtonOnPressed: () {
              filePaths.clear();
              indexPageView = 0;
              step = 1;
              notifyListeners();

              Navigator.pop(context);
              Navigator.pop(contextSheet!);
            },
            secondButtonText: "ANNULER",
            secondButtonOnPressed: () {
              Navigator.pop(context);
            }));
  }
}
