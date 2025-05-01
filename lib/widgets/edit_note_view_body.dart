import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/customs/language_detector.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field_try.dart';
import 'package:notes_app/widgets/edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  bool isAr = false;
  @override
  Widget build(BuildContext context) {
    //consted
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 50), //sized box umi
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.date = DateTime.now().toString();
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 50),
          CustomTextfieldTry(
            //uText: widget.note.title,
            textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
            onChange: (value) {
              isAr = LanguageDetector.detectLanguageIsAr(text: value);
              title = value;
              setState(() {});
            },
            hinText: widget.note.title,
            color: kPrimaryColor,
          ),
          const SizedBox(height: 20),
          CustomTextfieldTry(
            //uText: widget.note.subtitle,textDirection: isAr?TextDirection.rtl:TextDirection.ltr,
            textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
            onChange: (value) {
              isAr = LanguageDetector.detectLanguageIsAr(text: value);
              title = value;
              setState(() {});
            },
            hinText: widget.note.subtitle,
            color: kPrimaryColor,
            maxLines: 5,
          ),
          const SizedBox(height: 20),
          EditNoteColorList(note: widget.note),
        ],
      ),
    );
  }
}
