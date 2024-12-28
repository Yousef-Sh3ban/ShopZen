import 'package:base/features/cart/ui/widget/custom_Bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void placedDialog(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: 20, vertical: (screenHeight - 280) / 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              SvgPicture.asset("assets/icons/done.svg"),
              const SizedBox(height: 12),
              const Text(
                'Congratulations!',
                style: TextStyle(
                    fontFamily: "Alata",
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your order has been placed.',
                style: TextStyle(
                  color: Color(0xFF808080),
                    fontFamily: "Alata",
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 24,),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50),
                child: CustomBottom(
                    width: double.infinity,
                    height: 50,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Track Your Order'),
              ),
            ],
          ));
    },
  );
}
