import 'package:flutter/material.dart';

OutlineInputBorder buildBorder({Color? color}) {
  //Consted
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? Colors.white,
      style: BorderStyle.solid,
    ),
  );
}
