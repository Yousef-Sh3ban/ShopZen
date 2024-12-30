import 'package:animate_do/animate_do.dart';
import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/handlers/vibration_handler.dart';
import 'package:base/features/cart/ui/widget/custom_bottom.dart';
import 'package:base/features/checkout/ui/screen/payment_widget.dart';
import 'package:base/features/checkout/ui/widget/congration_dilog.dart';

import 'package:base/features/checkout/ui/widget/order_samry.dart';
import 'package:base/features/checkout/ui/widget/card_input_field.dart';

import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FadeInDown(
          duration: const Duration(milliseconds: 700),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        title: FadeInDown(
          duration: const Duration(milliseconds: 700),
          child: const Text('Checkout'),
        ),
        centerTitle: true,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: FadeIn(
        delay: const Duration(milliseconds: 200),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Delivery Address',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.addressPage);
                              },
                              child: Text('Change',
                                  style: TextStyle(
                                      color: SettingsCubit.instance.isDarkMode
                                          ? Colors.white
                                          : const Color(0xFF1A1A1A),
                                      decoration: TextDecoration.underline)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/loction.svg"),
                            const SizedBox(
                              width: 11.4,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "home",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                Text("925 S Chugach St #APT 10, Alaska 99645"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Payment Method',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff323135)),
                        ),
                        const SizedBox(height: 16),
                        const PaymentWidget(),
                        const SizedBox(height: 16),
                        const CardInputField(),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        const Text(
                          'Order Summary',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff323135)),
                        ),
                        const SizedBox(height: 8),
                        const OrderSummary(),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 52,
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        "assets/icons/discount.svg",
                                        color: const Color(0xff938F9C),
                                      ),
                                    ),
                                    hintText: 'Enter promo code',
                                    hintStyle: const TextStyle(
                                      color: Color(0xff938F9C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFE0E0E5)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFE0E0E5)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFE0E0E5)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            CustomBottom(
                              text: "Add",
                              height: 52,
                              width: 83,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 20),
              child: CustomBottom(
                  width: double.infinity,
                  height: 50,
                  onPressed: () async {
                    triggerVibration(duration: 600);
                    placedDialog(context);
                  },
                  text: "Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}
