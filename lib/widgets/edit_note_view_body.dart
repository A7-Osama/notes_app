import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    //consted
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 50), //sized box umi
          CustomAppBar(title: 'Edit Note', icon: Icons.check),
          SizedBox(height: 50),
          CustomTextfield(hinText: 'Title ...', color: kPrimaryColor),
          SizedBox(height: 20),
          CustomTextfield(
            hinText: 'Content ...',
            color: kPrimaryColor,
            maxLines: 20,
          ),
        ],
      ),
    );
  }
}
