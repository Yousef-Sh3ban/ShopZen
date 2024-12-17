// import 'package:flutter/material.dart';
import 'package:base/features/home_screen/ui/widget/Custom_Bottom_NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base/features/cart/ui/bloc/cart_cubit.dart';
import 'package:base/features/cart/ui/bloc/cart_state.dart';
import 'package:base/features/cart/ui/widget/cart_item_widget.dart';
import 'package:base/features/cart/ui/widget/checkout_summary_widget.dart';
import 'package:base/features/cart/ui/widget/empty_cart_widget.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Cart',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Color(0xff323135)),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartEmpty) {
            return EmptyCartWidget();
          } else if (state is CartLoaded) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 5),
              itemCount: state.items.length + 1,
              separatorBuilder: (ctx, index) => Divider(
                color: Color(0xffE0E0E5),
              ),
              itemBuilder: (ctx, index) {
                if (index < state.items.length) {
                  final item = state.items[index];
                  return CartItemWidget(item: item);
                }
                return CheckoutSummaryWidget(
                  totalAmount: state.totalAmount,
                  dliveryfree: 20,
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
