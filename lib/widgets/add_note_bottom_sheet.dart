import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            CustomTextfield(hinText: 'Title ...', color: KPrimaryColor),
            SizedBox(height: 20),
            CustomTextfield(
              hinText: 'Content ...',
              color: KPrimaryColor,
              maxLines: 5,
            ),
            SizedBox(height: 108),
            CustomButton(text: 'Add', color: KPrimaryColor),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
