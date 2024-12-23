import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base/configurations/app_theme.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/widget/deal_card.dart';
import 'package:base/handlers/fav.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool isLoading = true;
  List<ProductModel> favoriteProducts = [];
  final dbHelper = DBHelper.instance;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    try {
      final List<ProductModel> products = await dbHelper.getFavorites();
      setState(() {
        favoriteProducts = products;
        isLoading = false;
      });
    } catch (e) {
      log(e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onFavoriteChanged(int productId, bool isFavorite) {
    final productIndex =
        favoriteProducts.indexWhere((product) => product.id == productId);
    if (productIndex != -1) {
      setState(() {
        favoriteProducts[productIndex].isFavorite = isFavorite;
      });

      // If the product is no longer a favorite, delete it from the database
      if (!isFavorite) {
        dbHelper.deleteProduct(favoriteProducts[productIndex].id);
        
        // Use a delay to allow for animation before removing the item
        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            favoriteProducts.removeAt(productIndex); // Remove after animation
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (favoriteProducts.isEmpty) {
      return Center(child: SvgPicture.asset("assets/images/no_items.svg"));
    }

    List<DealCard> dealCaredList = _modelingProductList(favoriteProducts);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 70),
                    const Text(
                      "Favorite Items",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "${favoriteProducts.length} Items",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.maingrey),
                    ),
                    const SizedBox(height: 16)
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
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
                  // Wrap each DealCard with AnimatedOpacity
                  return AnimatedOpacity(
                    opacity: favoriteProducts[index].isFavorite ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: favoriteProducts[index].isFavorite
                        ? dealCaredList[index]
                        : Container(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DealCard> _modelingProductList(List<ProductModel> products) {
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
          isFavorite: products[i].isFavorite,
          onFavoriteChanged: (isFavorite) {
            _onFavoriteChanged(products[i].id, isFavorite);
          },
        ),
      );
    }
    return data;
  }
}
