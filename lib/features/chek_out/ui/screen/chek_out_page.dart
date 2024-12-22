import 'package:base/features/cart/ui/widget/custom_Bottom.dart';
import 'package:base/features/chek_out/ui/screen/payment_page.dart';
import 'package:base/features/chek_out/ui/widget/order_samry.dart';
import 'package:base/features/chek_out/ui/widget/payment.dart';

import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text('Home\n925 S Chugach St #APT 10, Alaska 99645'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.AddressPage);
                    },
                    child: const Text('Change',
                        style: TextStyle(color: Colors.deepPurple)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            PaymentPage(),
            const SizedBox(height: 16),
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            OrderSummary(),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter promo code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CustomBottom(
                  text: "add",
                  height: 52,
                  width: 83,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            CustomBottom(
                width: double.infinity,
                height: 50,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.CongratulationsPage);
                },
                text: "Place Order"),
          ],
        ),
      ),
    );
  }
}
