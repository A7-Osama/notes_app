import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Adjust animation speed
      curve: Curves.easeOut, // Smooth motion effect
      width: isActive ? 100 : 70,
      height: isActive ? 100 : 70,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isActive ? Border.all(color: Colors.white, width: 4) : null,
      ),
    );
  }
}
