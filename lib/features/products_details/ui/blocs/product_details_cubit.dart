import 'dart:developer';

import 'package:base/configurations/app_states.dart';
import 'package:base/features/products_details/data/repo/products_details_repo_imp.dart';
import 'package:base/features/products_details/domain/repo/notifaction_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<AppStates> {
  ProductDetailsCubit() : super(LoadingState());
  //==================================
  //variables
  //==================================
  final GetProductDetailsRepoInterface _getProductDetailsRepoInterface =
      GetProductDetailsRepoImp();

  //==================================
  //functions
  //==================================
  getProductDetails(int id) async { 
    log("emit loading state");
    emit(LoadingState());
    try {
      var product = await _getProductDetailsRepoInterface.getProductDetails(id);
      log("loded state");
      emit(LoadedState(product));
    } catch (e) {
      log("errr happend ");
      emit(ErrorState(e.toString()));
    }
  }
}
