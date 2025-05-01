import 'package:flutter/material.dart';
import 'package:notes_app/customs/outlined_border.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.txtInput,
    this.hinText,
    this.onChange,
    this.color = Colors.white,
    this.maxLines = 1,
    this.minLines,
    this.onSaved,
    this.textDirection,
    this.lblText,
  });

  final int? maxLines, minLines;
  final Color color;
  final TextInputType? txtInput;
  final String? hinText;
  final Function(String)? onChange;
  final void Function(String?)? onSaved;
  final TextDirection? textDirection;
  final String? lblText;
  @override
  Widget build(BuildContext context) {
    //consted
    return TextFormField(
      textDirection: textDirection,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required!';
        } else {
          return null;
        }
      },
      cursorColor: color,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: txtInput,
      onChanged: onChange,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: lblText,
        labelStyle: TextStyle(color: color),
        hintText: hinText,
        hintStyle: const TextStyle(color: Colors.white60),
        enabledBorder: buildBorder(),
        border: buildBorder(),
        focusedBorder: buildBorder(color: color),
      ),
    );
  }
}
