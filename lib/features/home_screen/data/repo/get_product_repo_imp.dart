import 'dart:developer';

import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/domain/repo/get_hot_deals_repo_interface.dart';
import 'package:base/handlers/fav.dart';
import 'package:dio/dio.dart';

class GetProductsRepoImp implements GetProductsRepoInterface {
  @override
  Future<List<ProductModel>> getHotDeals() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get("https://dummyjson.com/products?limit=10&skip=10");
      return await mapingPrductsFromAPI(response.data);
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
  Future<List<ProductModel>> mapingPrductsFromAPI(data) async {
    List<ProductModel> products = [];
    final dbHelper = DBHelper.instance;
    for (int i = 0; i < (data["products"] as List).length; i++) {
      products.add(
        ProductModel(
          id: data["products"][i]["id"],
          imageUrl: data["products"][i]["images"][0] ?? "NO image",
          title: data["products"][i]["title"] ?? "Unknown Title",
          price: data["products"][i]["price"] ?? 0.00,
          oldPrice: data["products"][i]["price"] ?? 0.00,
          rating: data["products"][i]["rating"] ?? 0.00,
          reviewsCount: data["products"][i]["reviews"] != null
              ? data["products"][i]["reviews"].length
              : 0,
          isFavorite:
              await dbHelper.isProductFavorite(data["products"][i]["id"]),
        ),
      );
    }
    return products;
  }
