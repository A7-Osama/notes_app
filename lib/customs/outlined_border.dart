import 'package:flutter/material.dart';

OutlineInputBorder buildBorder({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? Colors.white,
      style: BorderStyle.solid,
    ),
  );
}
