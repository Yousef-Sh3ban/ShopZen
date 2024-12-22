import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // لإضافة دعم SVG

class PaymentMethodContainer extends StatelessWidget {
  final String svgPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodContainer({
    required this.svgPath,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      height: 36,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff452CE8) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.deepPurple : Colors.grey,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.deepPurple.withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                )
              ]
            : [],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              width: 20,
              height: 20,
              color: isSelected ? Colors.white : Colors.black,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
