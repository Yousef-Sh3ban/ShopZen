import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationSearchBarProudact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Find your favorite items",
          hintStyle: const TextStyle(
              color: Color(0xFF938F9C),
              fontWeight: FontWeight.w400,
              fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SvgPicture.asset(
              "assets/icons/close.svg",
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFFFBFBFC),
        ),
      ),
    );
  }
}
