import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "Fashion", "icon": "assets/icons/dress.svg"},
    {"name": "Fitness", "icon": "assets/icons/fitness.svg"},
    {"name": "Living", "icon": "assets/icons/Living.svg"},
    {"name": "Games", "icon": "assets/icons/Games.svg"},
    {"name": "Stationery", "icon": "assets/icons/Stationery.svg"},
    {"name": "Beauty", "icon": "assets/icons/Beauty.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text("View All", style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffEBEFFF),
                ),
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      category["icon"]!,
                      width: 28,
                      height: 28,
                      color: Colors.grey[700],
                    ),
                    SizedBox(height: 4),
                    Text(
                      category["name"]!,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
