import 'package:base/features/home_screen/data/repo/authentication_repo_imp.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/domain/repo/get_hot_deals_repo_interface.dart';
import 'package:base/features/notifaction/data/repo/notifaction_repo_imp.dart';
import 'package:base/features/notifaction/domain/models/notifaction_model.dart';
import 'package:base/features/notifaction/domain/repo/notifaction_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/app_events.dart';
import '../../../../configurations/app_states.dart';

class NotifactionBloc extends Bloc<AppEvents, AppStates> {
  NotifactionBloc() : super(LoadingState()) {
    on<GetDataEvent>(getNotifaction);
  }
  //==================================
  //================================== Variables
  //==================================
  final GetNotifactionRepoInterface _getHotDealsint = GetDiscountRepoImp();

  //==================================
  //================================== Functions
  //==================================

  //==================================
  //================================== Events
  //==================================
  getNotifaction(GetDataEvent event, Emitter emit) async {
    List<NotifactionModel> products = await _getHotDealsint.getNotifaction();
    if (products.isNotEmpty) {
      emit(LoadedState(products));
    } else {
      emit(
        ErrorState("s"),
      );
    }
  }

}
