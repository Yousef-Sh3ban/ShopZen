import 'dart:developer';

import 'package:base/configurations/app_theme.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/widget/deal_card.dart';
import 'package:base/features/home_screen/ui/widget/hot_deals_widget.dart';
import 'package:base/handlers/favorites_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool isLoading = true;
  List<ProductModel> favoriteProducts = [];
  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    try {
      final products = await FavoritesHandler.loadFavorites();
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

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (favoriteProducts.isEmpty) {
      return Center(
        child:SvgPicture.asset("assets/images/no_items.svg")
      );
    }

    List<DealCard> dealCaredList = modelingProductList(favoriteProducts);
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
                    SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "Favorite Items",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      "${favoriteProducts.length} Items",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.maingrey),
                    ),
                    const SizedBox(height: 16,)
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
                  return dealCaredList[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
