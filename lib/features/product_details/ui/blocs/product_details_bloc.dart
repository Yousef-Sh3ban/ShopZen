
import 'package:base/configurations/app_states.dart';
import 'package:base/features/product_details/domain/models/product_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo_imp/product_details_repo_imp.dart';
import '../../domain/repo_interface/product_details_interface.dart';

class ProductDetailsBloc extends Cubit<AppStates>{
  ProductDetailsBloc(this.productId):super(LoadingState()){
    getProductDetails();
  }
  //====================================
  //==================================== Variables
  //====================================
  ProductDetails? productDetails;
  String productId;
  final ProductDetailsRepoInterface _productDetailsRepoInterface = ProductDetailsRepoImp();
  //====================================
  //==================================== Functions
  //====================================
  Future<ProductDetails> _getDetailsRequest()async{
    return await _productDetailsRepoInterface.getProductDetails(productId);
  }
  //====================================
  //==================================== Events
  //====================================
  void getProductDetails()async{
    emit(LoadingState());
    try{
      productDetails = await _getDetailsRequest();
      emit(LoadedState(productDetails));
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }
}