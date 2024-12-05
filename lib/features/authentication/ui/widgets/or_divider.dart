import 'package:flutter/material.dart';

class OrDvider extends StatelessWidget {
  const OrDvider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      child: Row(
        children: [
          Expanded(child: Divider()),
          SizedBox(
            width: 10,
          ),
          Text("Or"),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Divider())
        ],
      ),
    );
  }
}
