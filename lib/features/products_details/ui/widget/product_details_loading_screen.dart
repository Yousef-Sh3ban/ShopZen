import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redacted/redacted.dart';

class ProductDetailsLoadingScreen extends StatelessWidget {
  const ProductDetailsLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 260,
                      width: MediaQuery.of(context).size.width,
                      // child: Image.network(
                      //   selectedImage!,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Positioned(
                      top: 12,
                      right: 32,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          shape: BoxShape.rectangle,
                        ),
                        // child: FavoriteIcon(
                        //   productDetails: productDetails,
                        //   productId: productDetails.id,
                        // )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      // ProductImageWidget(
                      //   images: productDetails.images,
                      //   onImageSelected: (String image) {
                      //     setState(() {
                      //       selectedImage = image;
                      //     });
                      //   },
                      // ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "This is just for the laoding",
                        style: const TextStyle(
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            "100\$",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          const Expanded(child: SizedBox()),
                          SvgPicture.asset("assets/icons/star.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("5,00"),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "(1 Review)",
                            style: const TextStyle(
                                color: Color(0xFF68656E),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Product Details",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "This is the blankThis is the blankThis is the blankThis is the blankThis is the blankThis is the blankThis is the blankThis is the blankThis is the blank",
                  // maxLines: _isExpanded ? 2 : 1000,
                  // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontFamily: "Sf",
                      color: Color(0xFF68656E),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ).redacted(
              context: context,
              redact: true,
            ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 50,
            )).redacted(
              context: context,
              redact: true,
            ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
