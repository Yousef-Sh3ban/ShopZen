import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Dhaka, Bangladesh",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/icons/notifcation.svg",
              width: 25,
              height: 25,
            ),
          ],
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            hintText: "Find your favorite items",
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.qr_code_scanner),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
