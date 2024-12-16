import 'dart:math';

import 'package:base/features/cart/ui/widget/dased_lin.dart';
import 'package:flutter/material.dart';

class CheckoutSummaryWidget extends StatelessWidget {
  final double totalAmount;

  final double dliveryfree;
  final double? total;

  CheckoutSummaryWidget(
      {required this.totalAmount, this.total, required this.dliveryfree});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub-total',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff57545B),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Satoshi"),
              ),
              Text('\$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff323135))),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fee ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff57545B),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Satoshi",
                  )),
              Text('\$${dliveryfree.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff323135))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          const DashedLine(
            height: 1,
            dashWidth: 5,
            dashSpace: 3,
            color: Color(0xffE0E0E5),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total ",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w400)),
              Text(
                '\$${totalAmount + dliveryfree}',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff1A1A1A),
                ),
              ),
            ],
          ),
          SizedBox(height: 78),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff452CE8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Go To Checkout',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffFBFBFC),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Alata"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
