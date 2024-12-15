import 'package:base/features/home_screen/domain/models/product.dart';

abstract class GetProductsRepoInterface {
  Future<List<ProductModel>> getHotDeals();
}
