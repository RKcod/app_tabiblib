import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/views/identification_view.dart';
import 'package:tabiblib/features/documents/controllers/document_controller.dart';
import 'package:tabiblib/features/documents/controllers/note_controller.dart';
import 'package:tabiblib/features/documents/widgets/list_notes.dart';
import 'package:tabiblib/features/home/widgets/subject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DocumentView extends ConsumerStatefulWidget {
  const DocumentView({super.key});

  @override
  ConsumerState<DocumentView> createState() => _DocumentViewState();
}

class _DocumentViewState extends ConsumerState<DocumentView> {
  int indexTab = 0;

  @override
  Widget build(BuildContext context) {
    var sharedPreferences = ref.watch(sharedPreferencesProvider);
    var noteController = ref.watch(noteControllerProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.myDocuments,
          height: 100,
          bottom: TabBar(
              labelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              indicatorColor: Colors.white,
              onTap: (value) {
                setState(() {
                  indexTab = value;
                });
              },
              tabs: [
                Tab(
                  text: AppLocalizations.of(context)!.document,
                ),
                Tab(
                  text: AppLocalizations.of(context)!.notes,
                )
              ]),
        ),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Subject(
                      text: AppLocalizations.of(context)!.manageDocument,
                      subtitle: AppLocalizations.of(context)!
                          .manageDocumentDescription,
                      assetImage: "assets/images/empty_document.png",
                      hasButton: sharedPreferences.getString("user") == null,
                      textButton: AppLocalizations.of(context)!.signIn,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const IdentificationView()));
                      }),
                ),
              ),
              noteController.notes.isNotEmpty
                  ? const ListNotes()
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Subject(
                            text: AppLocalizations.of(context)!.createNote,
                            subtitle: AppLocalizations.of(context)!
                                .createNoteDescription,
                            assetImage: "assets/images/empty_note.png",
                            hasButton:
                                sharedPreferences.getString("user") == null,
                            textButton: AppLocalizations.of(context)!.signIn,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const IdentificationView()));
                            }),
                      ),
                    )
            ]),
        floatingActionButton: sharedPreferences.getString("user") == null
            ? null
            : TextButton(
                onPressed: indexTab == 0
                    ? () => ref
                        .read(documentControllerProvider)
                        .addDocument(context)
                    : () => ref.read(noteControllerProvider).addNote(context),
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    backgroundColor: Palette.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      indexTab == 0 ? Icons.add : Icons.note,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      indexTab == 0
                          ? AppLocalizations.of(context)!.addDocument
                          : AppLocalizations.of(context)!.addNote,
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
