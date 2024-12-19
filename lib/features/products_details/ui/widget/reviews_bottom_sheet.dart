import 'package:base/features/home_screen/domain/models/review_model.dart';
import 'package:flutter/material.dart';

void reviewsBottomSheet(BuildContext context, List<ReviewModel> reviews) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allow for height control try to remove
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.95,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                index == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Rating & Reviews",
                            style: TextStyle(
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: const Color(0xFFE0E0E5),
                          ),
                        ],
                      )
                    : const SizedBox(),
                Text(
                  reviews[index].reviewerName,
                  style: const TextStyle(
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  reviews[index].reviewerName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF68656E)),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
