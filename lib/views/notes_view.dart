import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
        child: SizedBox(
          height: 65,
          width: 65,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                },
              );
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}
