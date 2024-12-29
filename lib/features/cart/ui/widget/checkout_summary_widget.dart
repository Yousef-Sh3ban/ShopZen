import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/app/functions/max_two_diget.dart';
import 'package:base/features/cart/ui/widget/custom_Bottom.dart';
import 'package:base/features/cart/ui/widget/dased_lin.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class CheckoutSummaryWidget extends StatelessWidget {
  final double totalAmount;

  final double dliveryfree;
  final double? total;

  const CheckoutSummaryWidget(
      {super.key,
      required this.totalAmount,
      this.total,
      required this.dliveryfree});

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
                    color: SettingsCubit.instance.isDarkMode
                        ? Colors.white
                        : const Color(0xff57545B),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Satoshi"),
              ),
              Text(
                '\$${truncateToTwoDecimalPlaces(totalAmount)}',
                style: const TextStyle(
                  fontFamily: "Satoshi",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fee ",
                  style: TextStyle(
                    fontSize: 16,
                    color: SettingsCubit.instance.isDarkMode
                        ? Colors.white
                        : const Color(0xff57545B),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Satoshi",
                  )),
              Text('\$${dliveryfree.toStringAsFixed(2)}'),
              Text(
                "Delivery Fee ",
                style: TextStyle(
                  fontSize: 16,
                  color: SettingsCubit.instance.isDarkMode
                      ? Colors.white
                      : const Color(0xff57545B),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Satoshi",
                ),
              ),
              Text('\$${dliveryfree}',
                  style: const TextStyle(
                    fontFamily: "Satoshi",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const DashedLine(
            height: 1,
            dashWidth: 5,
            dashSpace: 3,
            color: Color(0xffE0E0E5),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",
                  style: TextStyle(
                      fontFamily: "Satoshi",
                      fontSize: 16,
                      color: SettingsCubit.instance.isDarkMode
                          ? Colors.white
                          : const Color(0xff57545B),
                      fontWeight: FontWeight.w400)),
              Text(
                '\$${truncateToTwoDecimalPlaces(totalAmount + dliveryfree)}',
                style: const TextStyle(
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 44),
          CustomBottom(
              width: double.infinity,
              height: 50,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.CheckoutPage);
              },
              text: "Go To Checkout"),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
