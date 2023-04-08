import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:tabiblib/core/common/custom_header_sheet.dart';
import 'package:tabiblib/core/extensions/context_extension.dart';
import 'package:tabiblib/features/documents/widgets/add_note.dart';
import 'package:tabiblib/models/note_model.dart';

var noteControllerProvider = ChangeNotifierProvider((ref) => NoteController());

class NoteController extends ChangeNotifier {
  List<NoteModel> notes = [];

  void addNoteList(BuildContext context, NoteModel value) {
    notes.add(value);
    Navigator.pop(context);
    notifyListeners();
  }

  void removeNoteList(NoteModel value) {
    notes.remove(value);
    notifyListeners();
  }

  void addNote(BuildContext context,
      {String initialTitle = "", String initialContent = ""}) {
    TextEditingController titleController =
        TextEditingController(text: initialTitle);
    TextEditingController contentController =
        TextEditingController(text: initialContent);

    showSlidingBottomSheet(context,
        builder: (builder) => SlidingSheetDialog(
            avoidStatusBar: true,
            duration: const Duration(milliseconds: 500),
            snapSpec: const SnapSpec(snappings: [0, 1]),
            headerBuilder: (context, state) => const Material(
                  color: Colors.transparent,
                  child: CustomHeaderSheet(
                    title: "Ma note",
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
                        child: AddNote(
                          titleController: titleController,
                          contentController: contentController,
                        )),
                  ),
                )));
  }
}
