
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/widget/deal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redacted/redacted.dart';

class HotDealsWidget extends StatelessWidget {
  List<ProductModel> products;
  HotDealsWidget({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    List<DealCard> dealCaredList = modelingProductList(products);
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
          itemCount: dealCaredList.length,
          itemBuilder: (context, index) {
            return dealCaredList[index];
          },
        ),
      ],
    );
  }
}

List<DealCard> modelingProductList(List<ProductModel> products) {
  List<DealCard> data = [];
  for (int i = 0; i < products.length; i++) {
    data.add(
      DealCard(
          id: products[i].id,
          imageUrl: products[i].imageUrl,
          title: products[i].title,
          price: products[i].price,
          oldPrice: products[i].oldPrice * 2,
          rating: products[i].rating,
          reviewsCount: products[i].reviewsCount,
          isFavorite: products[i].isFavorite),
    );
  }
  return data;
}
