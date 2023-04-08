import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/extensions/date_extension.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/documents/controllers/note_controller.dart';
import 'package:jiffy/jiffy.dart';

class ListNotes extends ConsumerWidget {
  const ListNotes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var noteController = ref.watch(noteControllerProvider);
    return ListView.separated(
        padding: const EdgeInsets.only(top: 16, bottom: 64),
        itemBuilder: (context, index) => Theme(
              data: ThemeData(splashColor: Colors.transparent),
              child: ListTile(
                onTap: () => noteController.addNote(context,
                    initialContent: noteController.notes[index].content,
                    initialTitle: noteController.notes[index].title),
                leading: Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Palette.thirdColor.withOpacity(0.25)),
                  child: const Icon(
                    Icons.note,
                    color: Palette.thirdColor,
                    size: 16,
                  ),
                ),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      noteController.notes[index].title,
                      style: const TextStyle(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${noteController.notes[index].dateCreated.toTime} - ",
                      // "${Jiffy.parseFromDateTime(noteController.notes[index].dateCreated).format(pattern: "dd MMM[.] yyyy")}",
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 13),
                    )
                  ],
                ),
                trailing: GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.more_horiz),
                  ),
                ),
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
        itemCount: noteController.notes.length);
  }
}
