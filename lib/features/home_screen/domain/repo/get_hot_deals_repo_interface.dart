import 'package:base/features/home_screen/domain/models/product_model.dart';

abstract class GetProductsRepoInterface {
  Future<List<ProductModel>> getHotDeals();
}

abstract class GetCategoriesProductsRepoInterface {
  Future<List<ProductModel>> getCategoriesProducts (String category);
}
