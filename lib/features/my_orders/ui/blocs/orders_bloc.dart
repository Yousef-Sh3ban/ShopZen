import 'package:base/configurations/app_states.dart';
import 'package:base/features/my_orders/data/repo/order_repo_imp.dart';
import 'package:base/features/my_orders/domain/models/order_model.dart';
import 'package:base/features/my_orders/domain/repo/order_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<AppStates> {
  OrderCubit() : super(LoadingState()) {
    getOrders();
  }

  Future<void> getOrders() async {
    GetOrderRepoInterface getOrderRepoInterface = GetOrderRepoImp();
    List<OrderModel> orders = await getOrderRepoInterface.getOrders();
    emit(LoadedState(orders));
  }
}
