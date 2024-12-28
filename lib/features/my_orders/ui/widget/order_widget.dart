import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/app/functions/max_two_diget.dart';
import 'package:base/features/home_screen/ui/widget/deal_card.dart';
import 'package:base/features/my_orders/domain/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderWidget extends StatelessWidget {
  final OrderModel order;
  const OrderWidget({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 122,
          width: double.infinity,
          decoration: BoxDecoration(
            color: SettingsCubit.instance.isDarkMode
                ? const Color.fromARGB(29, 255, 255, 255)
                : Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(color: const Color(0xFFd0d0d1)),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "\$${truncateToTwoDecimalPlaces(order.discountedTotal)}",
                    style: const TextStyle(
                        fontFamily: "Alata",
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "\$${truncateToTwoDecimalPlaces(order.total)}",
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Color(0xFFD80027),
                        fontFamily: "Alata",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFD80027)),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: const Color(0xFFd0d0d1),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset(
                    "assets/icons/order_cart.svg",
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "${order.quantity} Products",
                    style: const TextStyle(
                      fontFamily: "Alata",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 64,
                  ),
                  SvgPicture.asset(
                    "assets/icons/order_item.svg",
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "${order.quantity} item",
                    style: const TextStyle(
                      fontFamily: "Alata",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
