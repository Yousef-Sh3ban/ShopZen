import 'dart:developer';

import 'package:base/features/home_screen/data/repo/authentication_repo_imp.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/domain/repo/get_hot_deals_repo_interface.dart';
import 'package:base/features/products_search/domain/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class HomeBloc extends Bloc<AppEvents, AppStates> {
  HomeBloc() : super(InitialState()) {
    on<GetDataEvent>(getHotDeals);
  }
  //==================================
  //================================== Variables
  //==================================
  final GetProductsRepoInterface _getHotDealsint = GetProductsRepoImp();

  //==================================
  //================================== Functions
  //==================================

  //==================================
  //================================== Events
  //==================================
  getHotDeals(GetDataEvent event, Emitter emit) async {
    List<ProductModel> products = await _getHotDealsint.getHotDeals();
    if (products.isNotEmpty) {
      emit(LoadedState(products));
    } else {
      emit(
        LoadedState([]),
      );
    }
  }
}
