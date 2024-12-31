import 'package:base/configurations/app_theme.dart';
import 'package:base/features/cart/ui/widget/dased_lin.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub-total:',
              style: TextStyle(
                  fontFamily: "Satoshi",
                  color: Color(0xff57545B),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              '\$170.75',
              style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w500,
                color: AppTheme.darkPrimary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Fee:',
              style: TextStyle(
                  fontFamily: "Satoshi",
                  color: Color(0xff57545B),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            Text(
              '\$20.00',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppTheme.darkPrimary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discount:',
              style: TextStyle(
                fontFamily: "Satoshi",
                  color: Color(0xff57545B),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            Text(
              '\$10',
              style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w500,
                color: AppTheme.darkPrimary,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        DashedLine(),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total:',
                style: TextStyle(
                fontFamily: "Satoshi",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                )),
            Text('\$180.99',
                style: TextStyle(
                fontFamily: "Satoshi",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                )),
          ],
        ),
      ],
    );
  }
}
