import '../models/product_model.dart';

abstract class GetProductsRepoInterface {
  Future<List<ProductModel>> getHotDeals();
}

abstract class GetCategoriesProductsRepoInterface {
  Future<List<ProductModel>> getCategoriesProducts (String category);
}
