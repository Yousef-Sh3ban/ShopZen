import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // لإضافة دعم SVG

class PaymentMethodContainer extends StatelessWidget {
  final String svgPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodContainer({
    super.key,
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
                  offset: const Offset(0, 4),
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
              width: 15,
              height: 15,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 2.5),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xff323135),
                fontWeight: FontWeight.w400,
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
