import 'package:flutter/material.dart';

class StartText extends StatelessWidget {
  const StartText({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 32,
        fontFamily: "Alata",
      ),
    );
  }
}
