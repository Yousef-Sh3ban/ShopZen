import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderLoadingWidget extends StatelessWidget {
  const OrderLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 127,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFd0d0d1)),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "\$250",
                style: TextStyle(
                    fontFamily: "Alata",
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "\$250",
                style: TextStyle(
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
              const Text(
                "12 Products",
                style: TextStyle(
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
              const Text(
                "20 Products",
                style: TextStyle(
                  fontFamily: "Alata",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}