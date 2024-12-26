import 'package:base/features/products_details/ui/blocs/product_details_cubit.dart';
import 'package:base/features/products_details/ui/screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/handlers/fav.dart';
import 'package:redacted/redacted.dart';

class DealCardLoading extends StatelessWidget {
  DealCardLoading({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hot Deals",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: screenWidth / screenHeight * 1.2,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 180,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 120,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            shape: BoxShape.rectangle,
                          ),
                          child: const Icon(
                              size: 15,
                              Icons.favorite_border,
                              color: Color(0xFF323135)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "noting to wite",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Text(
                        "\$10000",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "\$10000",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF68656E),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Color(0xFF68656E)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        height: 21.5,
                        width: 21.5,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "5.0",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "(100)",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF68656E)),
                      ),
                    ],
                  ),
                ],
              ),
            ).redacted(
              context: context,
              redact: true,
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

final dbHelper = DBHelper.instance;
