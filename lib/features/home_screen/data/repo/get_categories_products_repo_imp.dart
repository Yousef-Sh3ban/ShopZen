
import 'package:base/app/models/product_model.dart';
import 'package:base/features/home_screen/domain/repo/get_hot_deals_repo_interface.dart';
import 'package:dio/dio.dart';
import 'get_product_repo_imp.dart';

class GetCategoriesProductsRepoImp
    implements GetCategoriesProductsRepoInterface {
  @override
  Future<List<ProductModel>> getCategoriesProducts(String categoryurl) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(categoryurl);
      return await mapingPrductsFromAPI(response.data);
    } catch (e) {
      return [];
    }
  }
}
