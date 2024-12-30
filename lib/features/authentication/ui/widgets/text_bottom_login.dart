import 'package:flutter/material.dart';

class TextBottomLogin extends StatelessWidget {
  const TextBottomLogin(
      {super.key, required this.text1, required this.text2, this.ontap});
  final String text1;
  final String text2;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: const TextStyle(
                color: Color(0xff68656E),
                fontFamily: "Satoshi",
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          InkWell(
            onTap: ontap,
            child: Text(
              text2,
              style: const TextStyle(
                  color: Color(0xff452CE8),
                  fontFamily: "Satoshi",
                  fontSize: 16,
                  decorationColor: Color(0xff452CE8),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
