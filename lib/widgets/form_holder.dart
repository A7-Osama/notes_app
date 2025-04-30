import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class FormHolder extends StatelessWidget {
  const FormHolder({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16.0,
        left: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: const SingleChildScrollView(child: AddNoteForm()),
    );
  }
}
