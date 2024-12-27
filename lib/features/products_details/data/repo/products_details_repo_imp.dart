import 'dart:developer';
import 'package:base/features/products_details/domain/models/product_details_model.dart';
import 'package:base/features/products_details/domain/repo/product_details_repo_interface.dart';
import 'package:base/network/app_end_points.dart';
import 'package:dio/dio.dart';

class GetProductDetailsRepoImp implements GetProductDetailsRepoInterface {
  @override
  Future<ProductDetailsModel> getProductDetails(int id) async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get(AppEndPoints.productDetailsUrl + (id.toString()));
      return ProductDetailsModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());

      return ProductDetailsModel(
          id: 0,
          category: "",
          stock: 0,
          reviews: [],
          images: [],
          discountPercentage: 0.0,
          description: "",
          title: "",
          price: 0.0,
          oldPrice: 0.0,
          rating: 0.0,
          reviewsCount: 0,
          isFavorite: false);
    }
  }
}
