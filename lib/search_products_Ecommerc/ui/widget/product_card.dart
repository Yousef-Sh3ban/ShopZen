import 'package:base/search_products_Ecommerc/domain/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.thumbnail,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          // Product Title
          Text(
            product.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          // Product Price
          Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
          const SizedBox(height: 4),
          // Product Rating
          Row(children: [
            SvgPicture.asset(
              "assets/icons/star.svg",
              height: 21.5,
              width: 21.5,
            ),
            SizedBox(width: 4),
            Text(
              product.rating.toString(),
              style: TextStyle(fontSize: 14),
            ),
          ]),
        ],
      ),
    );
  }
}
