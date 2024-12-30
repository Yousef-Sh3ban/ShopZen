import 'package:base/features/checkout/ui/widget/payment.dart';
import 'package:flutter/material.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
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
          label: "Pay",
          isSelected: selectedMethod == 'Pay',
          onTap: () {
            setState(() {
              selectedMethod = 'Pay';
            });
          },
        ),
      ],
    );
  }
}
