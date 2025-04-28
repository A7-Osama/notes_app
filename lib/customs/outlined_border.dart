import 'package:flutter/material.dart';

OutlineInputBorder buildBorder({Color color = Colors.white}) {
  //Consted
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color, style: BorderStyle.solid),
  );
}
