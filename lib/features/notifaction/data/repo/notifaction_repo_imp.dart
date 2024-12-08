import 'dart:developer';

import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/notifaction/domain/models/notifaction_model.dart';
import 'package:base/features/notifaction/domain/repo/notifaction_repo_interface.dart';
import 'package:dio/dio.dart';

class GetProductsRepoImp implements GetNotifactionRepoInterface {
  @override
  Future<List<NotifactionModel>> getNotifaction() async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .get("https://dummyjson.com/c/e6f8-72fb-4d9a-8202?page=1&limit=10");
      log("get completed");
      return await mapingData(response.data);
    } catch (e) {
      log(e.toString());
      log("i will return empty list");
      return [];
    }
  }

  Future<List<NotifactionModel>> mapingData(data) async {
    log("Start maping");
    log(data.toString());
    List<NotifactionModel> notifactions = [];
    for (int i = 0; i < 10; i++) {
      log(i.toString());
      // log(data["products"][i]["images"][0].toString());
      notifactions.add(NotifactionModel(iconUrl: '', message: '', title: ''));//add here the maping
    }
    log(notifactions.toString());
    return notifactions;
  }
}
