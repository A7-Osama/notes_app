import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    //consted
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EditNoteView();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, bottom: 24, top: 24),
        decoration: BoxDecoration(
          color: Color(note.color), //const Color(0xffFFCCB0),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                // 'Flutter Tip',
                note.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  // 'Build your career up with A7mad Me3yad',
                  note.subtitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withAlpha(128),
                  ),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    size: 26,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                // DateFormat("MMMM d, y").format(DateTime.now()),
                DateFormat(
                  "MMMM d, y  (hh:mm a)",
                ).format(DateTime.parse(note.date)),
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black.withAlpha(102),
                  fontWeight: FontWeight.bold,
                ),
                // textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
