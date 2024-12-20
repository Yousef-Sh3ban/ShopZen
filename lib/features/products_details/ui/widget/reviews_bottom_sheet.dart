import 'package:base/features/home_screen/domain/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void reviewsBottomSheet(BuildContext context, List<ReviewModel> reviews) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allow for height control try to remove
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.90,
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                            child: const Text(
                              "Rating & Reviews",
                              style: TextStyle(
                                  fontFamily: "Satoshi",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: const Color(0xFFE0E0E5),
                          ),                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: StarsWidget(rating: reviews[index].rating.round()),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    reviews[index].reviewerName,
                    style: const TextStyle(
                        color: Color(0xFF323135),
                        fontFamily: "Satoshi",
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    reviews[index].comment,
                    style: const TextStyle(
                      fontFamily: "Sf",
                      color: Color(0xFF68656E),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

class StarsWidget extends StatelessWidget {
  final int rating;
  const StarsWidget({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 8,
      children: [
        for (int i = 1; i < 6; i++)
          rating >= i
              ? SvgPicture.asset(
                  "assets/icons/star_on.svg",
                )
              : SvgPicture.asset(
                  "assets/icons/star_off.svg",
                ),
      ],
    );
  }
}
