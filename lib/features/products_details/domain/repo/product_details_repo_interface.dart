import 'package:base/features/products_details/domain/models/product_details_model.dart';

abstract class GetProductDetailsRepoInterface {
  Future<ProductDetailsModel> getProductDetails(int id);
}
