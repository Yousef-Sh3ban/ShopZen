import 'package:flutter/material.dart';

class textBottomLogin extends StatelessWidget {
  const textBottomLogin(
      {super.key, required this.text1, required this.text2, this.ontap});
  final String text1;
  final String text2;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: ontap,
        child: Text.rich(
          TextSpan(
              text: text1,
              style: TextStyle(
                  color: Color(0xff68656E),
                  // fontFamily: "Satoshi",
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              children: <TextSpan>[
                TextSpan(
                    text: text2,
                    style: TextStyle(
                        color: Color(0xff452CE8),
                        // fontFamily: "Satoshi",
                        fontSize: 16,
                        fontWeight: FontWeight.w700))
              ]),
        ),
      ),
    );
  }
}
