import 'package:flutter/material.dart';

class StartText extends StatelessWidget {
  const StartText({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: const TextStyle(
        color: Color(0xff323135),
        fontWeight: FontWeight.w400,
        fontSize: 32,
      ),
    );
  }
}
