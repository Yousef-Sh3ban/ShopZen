import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton(
      {super.key,
      required this.text,
      required this.imagepath,
      this.ontap,
      this.changeColor});
  final String text;
  final bool? changeColor;

  final String imagepath;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: const Color((0xffDAE2FF))),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagepath,
            width: 24,
            height: 24,
            color:
                changeColor ?? false ? Theme.of(context).iconTheme.color : null,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                ),
          )
        ],
      ),
    );
  }
}
