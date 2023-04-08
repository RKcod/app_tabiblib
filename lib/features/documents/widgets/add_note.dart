import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/features/documents/controllers/note_controller.dart';
import 'package:tabiblib/models/note_model.dart';

class AddNote extends ConsumerWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  const AddNote(
      {super.key,
      required this.titleController,
      required this.contentController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CustomTextfield(
          controller: titleController,
          title: "Titre",
          hintText: "Exemple: Rendez-vous chez le dentiste",
          isError: false,
          isValid: false,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextfield(
          controller: contentController,
          title: "Contenu",
          hintText: "Votre note",
          isError: false,
          isValid: false,
          maxLines: 6,
        ),
        const Spacer(),
        CustomButton(
          text: "ENREGISTRER",
          isFullWidth: true,
          onPressed: () {
            ref.read(noteControllerProvider).addNoteList(
                context,
                NoteModel(
                    title: titleController.text,
                    content: contentController.text,
                    dateCreated: DateTime.now()));
          },
          isDisabled:
              titleController.text.isEmpty || contentController.text.isEmpty,
        )
      ],
    );
  }
}
