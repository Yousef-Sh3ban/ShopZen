import 'package:flutter/material.dart';

import '../../domain/models/product.dart';

class ProductCardGridView extends StatelessWidget {
  const ProductCardGridView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(product.imageUrl,fit: BoxFit.cover,),
        ),
        const SizedBox(height: 16),
        Text(product.name),
      ],
    );
  }
}
