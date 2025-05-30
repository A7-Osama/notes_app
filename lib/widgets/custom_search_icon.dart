import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    //Consted
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: kPrimaryColor, //Colors.white.withAlpha(13),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 28, color: Colors.black),
      ),
    );
  }
}
