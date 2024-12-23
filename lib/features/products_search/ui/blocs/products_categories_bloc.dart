import 'package:base/configurations/app_states.dart';
import 'package:base/features/products_search/domain/models/category.dart';
import 'package:base/features/products_search/domain/repo_interface/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo_imp/product_repo_imp.dart';

class ProductsCategoriesBloc extends Cubit<AppStates>{
  ProductsCategoriesBloc(): super(LoadingState()){
    getCategories();
  }
  //========================================
  //======================================== Variables
  //========================================
  List<Category> categories = [];
  final ProductsRepoInterface _repo = ProductsRepoImp();
  //========================================
  //======================================== Functions
  //========================================
  Future<List<Category>> _getCategoriesRequest() async {
    return await _repo.getCategories();
  }
  //========================================
  //======================================== Functions
  //========================================
  void getCategories() async {
    emit(LoadingState());
    try {
      categories = await _getCategoriesRequest();
      if (categories.isEmpty) {
        emit(EmptyState());
      }
      emit(LoadedState(categories));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

}