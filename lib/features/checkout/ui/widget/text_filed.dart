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
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.credit_card, color: Colors.black),
              SizedBox(width: 8),
              Text(
                "VISA",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                width: 4.15,
              ),
              Text(
                '**** **** **** 2512',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff323135),
                ),
              ),
            ],
          ),
          // Edit Icon
          InkWell(
            onTap: () {
              // Handle edit tap
              debugPrint("Edit Card Tapped");
            },
            child: SvgPicture.asset("assets/icons/edit.svg"),
          ),
        ],
      ),
    );
  }
}
