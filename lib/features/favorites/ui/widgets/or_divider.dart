import 'package:flutter/material.dart';

class OrDvider extends StatelessWidget {
  const OrDvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        children: [
          Expanded(child: Divider()),
          SizedBox(
            width: 10,
          ),
          Text(
            "Or",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF938F9C),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Divider())
        ],
      ),
    );
  }
}
