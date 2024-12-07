
import 'package:base/configurations/app_states.dart';
import 'package:base/features/products_search/domain/models/category.dart';
import 'package:base/features/products_search/domain/repo_interface/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo_imp/product_repo_imp.dart';
import '../../domain/models/product.dart';

class ProductsSearchBloc extends Cubit<AppStates> {
  ProductsSearchBloc() : super(LoadingState()) {
    getProducts();
  }

  //========================================
  //======================================== Variables
  //========================================
  bool showGrid = false;
  Category? selectedCategoryFilter;
  List<Product> products = [];
  final ProductsRepoInterface _repo = ProductsRepoImp();

  //========================================
  //======================================== Functions
  //========================================
  Future<List<Product>> _getProductsRequest() async => await _repo.getProducts(
        categoryId: selectedCategoryFilter?.id.toString(),
      );

  //========================================
  //======================================== Events
  //========================================
  void toggleView() async {
    showGrid = !showGrid;
    emit(LoadedState(products));
  }

  void filterByCategory(Category category) async {
    if (selectedCategoryFilter?.id == category.id) {
      selectedCategoryFilter = null;
    } else {
      selectedCategoryFilter = category;
    }
    getProducts();
  }

  void getProducts() async {
    emit(LoadingState());
    try {
      products = await _getProductsRequest();
      if (products.isEmpty) {
        emit(EmptyState());
      }
      emit(LoadedState(products));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
