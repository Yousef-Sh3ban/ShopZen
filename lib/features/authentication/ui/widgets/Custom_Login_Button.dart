import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  CustomLoginButton(
      {super.key,
      required this.text,
      required this.textcolor,
      required this.imagepath,
      required this.ContinarColor,
      this.ontap});
  final String text;
  final Color textcolor;
  final String imagepath;
  final Color ContinarColor;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color((0xffDAE2FF))),
        color: ContinarColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagepath,
            width: 24,
            height: 24,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(
                color: textcolor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: "Alata"),
          )
        ],
      ),
    );
  }
}
