import 'package:flutter/material.dart';
import 'package:notes_app/helpers/outlined_border.dart';

class CustomTextfieldStfl extends StatefulWidget {
  const CustomTextfieldStfl({
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
    this.textDirection,
    this.textAlign,
  });

  final String? uText;
  final int? maxLines, minLines;
  final Color color;
  final TextInputType? txtInput;
  final String? hinText;
  final Function(String)? onChange;
  final void Function(String?)? onSaved;
  final TextEditingController? textEditingController;
  final TextDirection? textDirection;
  final TextAlign? textAlign;

  @override
  State<CustomTextfieldStfl> createState() => _CustomTextfieldStflState();
}

class _CustomTextfieldStflState extends State<CustomTextfieldStfl> {
  late TextEditingController _controller;
  late TextDirection txxx;

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
      textAlign: widget.textAlign ?? TextAlign.left,
      textCapitalization: TextCapitalization.sentences,
      textDirection: widget.textDirection,
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
