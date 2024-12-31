import 'package:base/features/cart/ui/widget/custom_bottom.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void placedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 270),
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
                      fontFamily: "Satoshi",
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: CustomBottom(
                      width: double.infinity,
                      height: 50,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.home,
                          (route) => false,
                        );
                      },
                      text: 'Track Your Order'),
                ),
              ],
            ),
          ));
    },
  );
}
