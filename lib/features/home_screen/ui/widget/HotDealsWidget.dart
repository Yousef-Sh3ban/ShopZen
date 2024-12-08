import 'dart:developer';

import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/widget/DealCard.dart';
import 'package:flutter/widgets.dart';

class HotDealsWidget extends StatelessWidget {
  List<ProductModel> products;
  HotDealsWidget({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    List<DealCard> dealCaredList = modelingProductList(products);
    log("number of elemnts in the list is :");
    log(dealCaredList[1].title.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hot Deals",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
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
