import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardInputField extends StatelessWidget {
  const CardInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/icons/visa.svg"),
              const SizedBox(width: 8),
              const SizedBox(
                width: 4.15,
              ),
              const Text(
                '**** **** **** 2512',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff323135),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              debugPrint("Edit Card Tapped");
            },
            child: SvgPicture.asset("assets/icons/edit.svg"),
          ),
        ],
      ),
    );
  }
}
