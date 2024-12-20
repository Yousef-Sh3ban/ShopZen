import 'dart:developer';

import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/widget/deal_card.dart';
import 'package:base/features/products_details/domain/models/product_details_model.dart';
import 'package:base/handlers/fav.dart';
import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  final int productId;
  final ProductDetailsModel productDetails;
  const FavoriteIcon({
    super.key,
    required this.productDetails,
    required this.productId,
  });

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;
  final dbHelper = DBHelper.instance;

  @override
  void initState() {
    super.initState();
    dbHelper.isProductFavorite(widget.productId).then(
      (isFav) {
        setState(
          () {
            isFavorite = isFav;
            widget.productDetails.isFavorite = isFav;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      child: Transform.translate(
        offset: const Offset(-12, 0),
        child: Icon(
            size: 15,
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color:
                isFavorite ? const Color(0xFFDE1135) : const Color(0xFF323135)),
      ),
      onPressed: () {
        setState(() {
          log(isFavorite.toString());
          isFavorite = !isFavorite;
          widget.productDetails.isFavorite = isFavorite;
          if (isFavorite) {
            dbHelper.insertProduct(ProductModel(
              id: widget.productDetails.id,
              imageUrl: widget.productDetails.images[0],
              title: widget.productDetails.title,
              price: widget.productDetails.price,
              oldPrice: widget.productDetails.oldPrice,
              rating: widget.productDetails.rating,
              reviewsCount: widget.productDetails.reviewsCount,
              isFavorite: isFavorite,
            ));
          } else {
            dbHelper.deleteProduct(widget.productId);
          }
        });
      },
    );
  }
}
