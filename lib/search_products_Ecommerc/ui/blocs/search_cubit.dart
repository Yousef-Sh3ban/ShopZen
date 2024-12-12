import 'package:base/search_products_Ecommerc/domain/models/product_model.dart';
import 'package:base/search_products_Ecommerc/ui/blocs/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];
  List<ProductModel> searchResults = [];

  final Dio _dio = Dio();

  Future<void> fetchProducts() async {
    emit(SearchLoading());
    try {
      final response =
          await _dio.get('https://dummyjson.com/products?limit=10&skip=10');
      products = (response.data['products'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      emit(SearchLoaded(products));
    } catch (e) {
      emit(SearchError('Failed to fetch products'));
    }
  }

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      emit(SearchLoaded(products));
      return;
    }
    emit(SearchLoading());
    try {
      final response = await _dio.get('https://dummyjson.com/products/search',
          queryParameters: {'q': query});
      searchResults = (response.data['products'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      if (searchResults.isEmpty) {
        emit(SearchEmpty('No products found for "$query"'));
      } else {
        emit(SearchLoaded(searchResults));
      }
    } catch (e) {
      emit(SearchError('Failed to search products'));
    }
  }
}
