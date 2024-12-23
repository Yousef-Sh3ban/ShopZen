import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final List<String> images;
  const ProductImageWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 16, //from the new update :)
        children: [
          for (int i = 0; i < images.length; i++)
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFA7A5AF),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(images[i]),
              ),
            ),
        ],
      ),
    );
  }
}
