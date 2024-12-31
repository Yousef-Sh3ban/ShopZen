import 'package:base/configurations/app_theme.dart';
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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppTheme.mainColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16,
                color: Color(0xffFBFBFC),
                fontWeight: FontWeight.w400,
                fontFamily: "Alata"),
          ),
        ),
      ),
    );
  }
}
