import 'dart:developer';

import 'package:base/features/my_orders/domain/models/order_model.dart';
import 'package:base/features/my_orders/domain/repo/order_repo_interface.dart';
import 'package:base/network/app_end_points.dart';
import 'package:dio/dio.dart';

class GetOrderRepoImp implements GetOrderRepoInterface {
  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(AppEndPoints.ordersUrl);
      return mapingOrdersData(response.data);
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  List<OrderModel> mapingOrdersData(data) {
    List<OrderModel> orders = (data["carts"][0]["products"] as List)
        .map((json) => OrderModel.fromJson(json))
        .toList();
    return orders;
  }
}
