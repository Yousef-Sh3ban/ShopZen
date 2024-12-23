import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton(
      {super.key,
      required this.text,
      // required this.textcolor,
      required this.imagepath,
      // required this.continarColor,
      this.ontap,
      this.changeColor});
  final String text;
  final bool? changeColor;

  // final Color textcolor;
  final String imagepath;
  // final Color continarColor;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: const Color((0xffDAE2FF))),
        // color: continarColor,
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
                // color: textcolor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                ),
          )
        ],
      ),
    );
  }
}
