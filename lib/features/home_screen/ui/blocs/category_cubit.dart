import 'dart:developer';

import 'package:base/configurations/app_states.dart';
import 'package:base/features/home_screen/data/repo/get_categories_products_repo_imp.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/domain/repo/get_hot_deals_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<AppStates> {
  CategoryCubit() : super(LoadingState());
  //==================================
  //variables
  //==================================
  final GetCategoriesProductsRepoInterface _getCategoriesProducts =
      GetCategoriesProductsRepoImp();

  //==================================
  //functions
  //==================================
  getCategoriesProducts(String categoryurl) async {
    emit(LoadingState());
    List<ProductModel> products =
        await _getCategoriesProducts.getCategoriesProducts(categoryurl);
    emit(CategoryProductsState(data: products));
  }
}
