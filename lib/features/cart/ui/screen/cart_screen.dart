import 'package:animate_do/animate_do.dart';

import 'package:base/features/home_screen/ui/screen/categories_screen.dart';
import 'package:base/features/home_screen/ui/screen/home_screen.dart';
import 'package:base/features/products_details/ui/screen/product_details_screen.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base/features/cart/ui/bloc/cart_cubit.dart';
import 'package:base/features/cart/ui/bloc/cart_state.dart';
import 'package:base/features/cart/ui/widget/cart_item_widget.dart';
import 'package:base/features/cart/ui/widget/checkout_summary_widget.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        elevation: 0,
        title: FadeInDown(
          from: 50,
          child: const Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ),
        ),
        leading: FadeInDown(
          from: 50,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, AppRoutes.productDetails);
            },
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartEmpty) {
            return FadeIn(
              child: Center(
                  child: SvgPicture.asset("assets/images/empty_cart.svg")),
            );
          } else if (state is CartLoaded) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 270),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    itemCount: state.items.length + 1,
                    separatorBuilder: (ctx, index) => const Divider(
                      color: Color(0xffE0E0E5),
                    ),
                    itemBuilder: (ctx, index) {
                      if (index < state.items.length) {
                        final item = state.items[index];
                        return FadeIn(
                          duration: const Duration(milliseconds: 700),
                          child: CartItemWidget(item: item),
                        );
                      }

                      return const SizedBox(height: 90);
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: FadeIn(
                      child: CheckoutSummaryWidget(
                        totalAmount: state.totalAmount,
                        dliveryfree: 20,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text("NO DATA"));
        },
      ),
    );
  }
}
