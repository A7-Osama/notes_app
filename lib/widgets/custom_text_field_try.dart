import 'package:flutter/material.dart';
import 'package:notes_app/customs/outlined_border.dart';

class CustomTextfieldTry extends StatefulWidget {
  const CustomTextfieldTry({
    super.key,
    this.txtInput,
    this.hinText,
    this.onChange,
    this.color = Colors.white,
    this.maxLines = 1,
    this.minLines,
    this.onSaved,
    this.uText,
    this.textEditingController,
  });

  final String? uText;
  final int? maxLines, minLines;
  final Color color;
  final TextInputType? txtInput;
  final String? hinText;
  final Function(String)? onChange;
  final void Function(String?)? onSaved;
  final TextEditingController? textEditingController;

  @override
  State<CustomTextfieldTry> createState() => _CustomTextfieldTryState();
}

class _CustomTextfieldTryState extends State<CustomTextfieldTry> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the hint text
    _controller = TextEditingController(text: widget.hinText);
  }

  @override
  Widget build(BuildContext context) {
    //consted
    return TextFormField(
      controller: _controller, //widget.textEditingController,
      // initialValue: uText,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required!';
        } else {
          return null;
        }
      },
      cursorColor: widget.color,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      keyboardType: widget.txtInput,
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      }, //widget.onChange,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget.hinText,
        hintStyle: TextStyle(color: widget.color),
        enabledBorder: buildBorder(),
        border: buildBorder(),
        focusedBorder: buildBorder(color: widget.color),
      ),
    );
  }
}
