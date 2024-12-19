import 'dart:math';

import 'package:base/features/home_screen/domain/models/review_model.dart';
import 'package:base/features/products_details/ui/widget/reviews_bottom_sheet.dart';
import 'package:flutter/material.dart';

class DescreptionWidget extends StatefulWidget {
  final String description;
  final List<ReviewModel> reviews;
  const DescreptionWidget(
      {required this.reviews, required this.description, super.key});

  @override
  State<DescreptionWidget> createState() => _DescreptionWidgetState();
}

class _DescreptionWidgetState extends State<DescreptionWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Product Details",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.description,
                    maxLines:
                        _isExpanded ? 2 : 1000, // Show 3 lines if not expanded
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Color(0xFF68656E),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded; // Toggle expansion state
                      });
                    },
                    child: Text(
                      _isExpanded ? "Read More" : "",
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF452CE8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: const Color(0xFFE0E0E5),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  !_isExpanded
                      ? InkWell(
                          child: const Row(
                            children: [
                              Text(
                                "Rating & Reviews",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                              ),
                            ],
                          ),
                          onTap: () {
                            reviewsBottomSheet(context, widget.reviews);
                          },
                        )
                      : SizedBox(),SizedBox(height: 22,)
                ],
              ),
            ),
            !_isExpanded? Container(
              height: 1,
              width: double.infinity,
              color: const Color(0xFFE0E0E5),
            ):SizedBox()
          ],
        );
      },
    );
  }
}
