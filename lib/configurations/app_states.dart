import 'package:base/features/home_screen/domain/models/product_model.dart';

abstract class AppStates {}

class InitialState extends AppStates {}

class LoadingState extends AppStates {}

class SuccessState extends AppStates {}

class LoadedState extends AppStates {
  final dynamic data;
  LoadedState(this.data);
}

class CategoriesState extends AppStates {
  final dynamic data;
  CategoriesState({required this.data});
}

class CategoryProductsState extends AppStates {
  final List<ProductModel> data;
  CategoryProductsState({required this.data});
}

class EmptyState extends AppStates {}

class ReadyToLoginState extends AppStates {}

class NotReadyToLoginState extends AppStates {
  String? message;
  NotReadyToLoginState({this.message});
}

class ErrorState extends AppStates {
  final String errorMessage;
  ErrorState(this.errorMessage);

  String? get error => null;
}
