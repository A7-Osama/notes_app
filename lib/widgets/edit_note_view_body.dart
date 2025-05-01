import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/helpers/lan_detector.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field_stfl.dart';
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
          const SizedBox(height: 50),
          _buildAppBar(),
          const SizedBox(height: 50),
          _buildTitleField(),
          const SizedBox(height: 20),
          _buildContentField(),
          const SizedBox(height: 20),
          EditNoteColorList(note: widget.note),
        ],
      ),
    );
  }

  // Extracted AppBar Widget
  Widget _buildAppBar() {
    return CustomAppBar(
      title: 'Edit Note',
      icon: Icons.check,
      onPressed: _handleSaveNote,
    );
  }

  // Extracted Title Field
  Widget _buildTitleField() {
    return CustomTextfieldStfl(
      textDirection: LanDetector.isArDir(isAr: widget.note.isArTitle),
      textAlign: LanDetector.isArAl(isAr: widget.note.isArTitle),
      onChange: (value) {
        widget.note.isArTitle = LanDetector.isItAr(text: value);
        title = value;
        setState(() {});
      },
      hinText: widget.note.title,
      color: kPrimaryColor,
    );
  }

  // Extracted Content Field
  Widget _buildContentField() {
    return CustomTextfieldStfl(
      textDirection: LanDetector.isArDir(isAr: widget.note.isArContent),
      textAlign: LanDetector.isArAl(isAr: widget.note.isArContent),
      onChange: (value) {
        widget.note.isArContent = LanDetector.isItAr(text: value);
        content = value;
        setState(() {});
      },
      hinText: widget.note.subtitle,
      color: kPrimaryColor,
      maxLines: 5,
    );
  }

  void _handleSaveNote() {
    widget.note.title = title ?? widget.note.title;
    widget.note.subtitle = content ?? widget.note.subtitle;
    widget.note.date = DateTime.now().toString();

    widget.note.save();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    Navigator.pop(context);
  }
}
