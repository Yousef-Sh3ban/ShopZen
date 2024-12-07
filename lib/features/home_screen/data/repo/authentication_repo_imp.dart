import 'dart:developer';

import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/domain/repo/get_hot_deals_repo_interface.dart';
import 'package:dio/dio.dart';

class GetProductsRepoImp implements GetProductsRepoInterface {
  @override
  Future<List<ProductModel>> getHotDeals() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get("https://dummyjson.com/products?limit=10&skip=10");
      log("get completed");
      return await mapingData(response.data);
    } catch (e) {
      log(e.toString());
      log("i will return empty list");
      return [];
    }
  }

  Future<List<ProductModel>> mapingData(data) async {
    log("Start maping");
    // log(data.toString());
    List<ProductModel> products = [];
    for (int i = 0; i < 10; i++) {
      log(i.toString());
      log(data["products"][i]["images"][0].toString());
      products.add(ProductModel(
          imageUrl: data["products"][i]["images"][0] ?? "NO image",
          title: data["products"][i]["title"] ?? "Unknown Title",
          price: data["products"][i]["price"] ?? 0.00,
          oldPrice: data["products"][i]["price"] ?? 0.00,
          rating: data["products"][i]["rating"] ?? 0.00,
          reviewsCount: data["products"][i]["reviews"] != null
              ? data["products"][i]["reviews"].length
              : 0,
          isFavorite: false));
    }
    log(products.toString());
    return products;
  }
}
