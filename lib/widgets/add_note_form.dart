import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/helpers/lan_detector.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_circle_list.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  bool isArTitle = false;
  bool isArContent = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          _buildTitleField(),
          const SizedBox(height: 20),
          _buildContentField(),
          const SizedBox(height: 30),
          const ColorCircleList(),
          const SizedBox(height: 30),
          _buildAddButton(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTitleField() {
    return CustomTextfield(
      textDirection: LanDetector.isArDir(isAr: isArTitle),
      onChange: (value) {
        isArTitle = LanDetector.isItAr(text: value);
        setState(() {});
      },
      onSaved: (value) => title = value,
      lblText: 'Title',
      hinText: 'Write a brief title ...',
      color: kPrimaryColor,
    );
  }

  Widget _buildContentField() {
    return CustomTextfield(
      textDirection: LanDetector.isArDir(isAr: isArContent),
      onChange: (value) {
        isArContent = LanDetector.isItAr(text: value);
        setState(() {});
      },
      onSaved: (value) => subtitle = value,
      lblText: 'Content',
      hinText: 'Here you go...',
      color: kPrimaryColor,
      maxLines: 5,
    );
  }

  Widget _buildAddButton() {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return CustomButton(
          isLoading: state is AddNoteLoading,
          onTap: _handleAddNote,
          text: 'Add',
          color: kPrimaryColor,
        );
      },
    );
  }

  void _handleAddNote() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      NoteModel note = NoteModel(
        title: title!,
        subtitle: subtitle!,
        date: DateTime.now().toString(),
        color: Color(0xffFFCCB0).toARGB32(),
        isArTitle: isArTitle,
        isArContent: isArContent,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(note);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
