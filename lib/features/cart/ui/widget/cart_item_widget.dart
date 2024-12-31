import 'package:base/configurations/app_theme.dart';
import 'package:base/features/cart/domain/models/cart_item.dart';
import 'package:base/features/cart/ui/bloc/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Satoshi"),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Size: XL',
                  style: TextStyle(color: AppTheme.maingrey, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/remove.svg",
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {
                        context
                            .read<CartCubit>()
                            .updateQuantity(item.id, false);
                      },
                    ),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/add.svg',
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {
                        context.read<CartCubit>().updateQuantity(item.id, true);
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/delet.svg',
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {
                        context.read<CartCubit>().removeItem(item.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
