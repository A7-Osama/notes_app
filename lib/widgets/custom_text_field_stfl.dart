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
    this.textEditingController,
    this.textDirection,
    this.textAlign,
  });

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

  @override
  void initState() {
    super.initState();
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
      onSaved: widget.onSaved,
      validator: _validateField,
      cursorColor: widget.color,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      keyboardType: widget.txtInput,
      onChanged: _handleOnChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintTextDirection: widget.textDirection,
        hintText: widget.hinText,
        hintStyle: TextStyle(color: widget.color),
        enabledBorder: buildBorder(),
        border: buildBorder(),
        focusedBorder: buildBorder(color: widget.color),
      ),
    );
  }

  String? _validateField(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Field is required!';
    }
    return null;
  }

  void _handleOnChanged(String value) {
    if (widget.onChange != null) {
      widget.onChange!(value);
    }
  }
}
