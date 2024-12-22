import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key,
      this.onPressed,
      required this.text,
      required this.height,
      required this.width});
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff452CE8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: Color(0xffFBFBFC),
              fontWeight: FontWeight.w400,
              fontFamily: "Alata"),
        ),
      ),
    );
  }
}
