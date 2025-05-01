import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
          radius: 50,
          backgroundColor: const Color(0xffFFFFFF),
          child: CircleAvatar(radius: 48, backgroundColor: color),
        )
        : CircleAvatar(radius: 35, backgroundColor: color);
  }
}
