import 'package:base/features/my_orders/domain/models/order_model.dart';

abstract class GetOrderRepoInterface {
  Future<List<OrderModel>> getOrders();
}
