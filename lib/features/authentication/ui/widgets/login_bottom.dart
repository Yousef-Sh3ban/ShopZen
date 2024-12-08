import 'package:flutter/material.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({super.key, required this.text, this.ontap, this.color});
  final String text;
  final VoidCallback? ontap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: ontap,
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}
