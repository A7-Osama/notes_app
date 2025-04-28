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
  });

  final int? maxLines, minLines;
  final Color color;
  final TextInputType? txtInput;
  final String? hinText;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    //consted
    return TextField(
      cursorColor: color,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: txtInput,
      onChanged: onChange,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(color: color),
        enabledBorder: buildBorder(),
        border: buildBorder(),
        focusedBorder: buildBorder(color: color),
      ),
    );
  }
}
