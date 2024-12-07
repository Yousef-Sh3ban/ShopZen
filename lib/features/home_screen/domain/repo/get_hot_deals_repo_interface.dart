import '../models/product_model.dart';

abstract class GetProductsRepoInterface{
  Future<List<ProductModel>> getHotDeals();
}