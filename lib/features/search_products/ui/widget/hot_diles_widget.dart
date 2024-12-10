import 'dart:developer';

import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/widget/deal_card.dart';
import 'package:flutter/widgets.dart';

class HotDealsWidgetSearch extends StatelessWidget {
  List<ProductModel> products;
  HotDealsWidgetSearch({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    List<DealCard> dealCaredList = modelingProductList(products);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.65,
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
          imageUrl: products[i].imageUrl,
          title: products[i].title,
          price: products[i].price,
          oldPrice: products[i].oldPrice * 2,
          rating: products[i].rating,
          reviewsCount: products[i].reviewsCount,
          isFavorite: false),
    );
  }
  return data;
}
