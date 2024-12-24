import 'dart:developer';

import 'package:base/features/home_screen/data/repo/get_product_repo_imp.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/domain/repo/get_hot_deals_repo_interface.dart';
import 'package:base/network/network_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class HomeBloc extends Bloc<AppEvents, AppStates> {
  HomeBloc() : super(LoadingState()) {
    on<GetDataEvent>(getHotDeals);
    on<GetCategoriesEvent>(getCategories);
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
    try{
    List<ProductModel> products = await _getHotDealsint.getHotDeals();
    if (products.isNotEmpty) {
      emit(LoadedState(products));
    } else {
      emit(
        LoadedState([]),
      );
    }
    }catch(e)
    {
      log("error: ${e.toString()}");
    }
  }

  getCategories(GetCategoriesEvent event, Emitter emit) async {
    Response categories =
        await NetworkHandler.instance.get('products/categories');

    emit(CategoriesState(data: categories));
  }
}
