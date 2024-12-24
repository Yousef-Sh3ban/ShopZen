import 'package:base/features/checkout/ui/widget/payment.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedMethod = 'Card';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PaymentMethodContainer(
          svgPath: "assets/icons/cart2.svg",
          label: "Card",
          isSelected: selectedMethod == 'Card',
          onTap: () {
            setState(() {
              selectedMethod = 'Card';
            });
          },
        ),
        PaymentMethodContainer(
          svgPath: "assets/icons/cash.svg",
          label: "Cash",
          isSelected: selectedMethod == 'Cash',
          onTap: () {
            setState(() {
              selectedMethod = 'Cash';
            });
          },
        ),
        PaymentMethodContainer(
          svgPath: "assets/icons/apple.svg",
          label: "Apple Pay",
          isSelected: selectedMethod == 'Apple Pay',
          onTap: () {
            setState(() {
              selectedMethod = 'Apple Pay';
            });
          },
        ),
      ],
    );
  }
}
