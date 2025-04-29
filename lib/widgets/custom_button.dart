import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.color = Colors.white,
    this.isLoading = false,
  });
  final bool isLoading;
  final String text;
  final VoidCallback? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    //consted
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: 55,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child:
              isLoading
                  ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                  : Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
        ),
      ),
    );
  }
}
