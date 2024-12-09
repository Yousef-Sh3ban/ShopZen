import 'dart:developer';

import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/notifaction/domain/models/notifaction_model.dart';
import 'package:base/features/notifaction/domain/repo/notifaction_repo_interface.dart';
import 'package:base/network/app_end_points.dart';
import 'package:dio/dio.dart';

class GetDiscountRepoImp implements GetNotifactionRepoInterface {
  @override
  Future<List<NotifactionModel>> getNotifaction() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(AppEndPoints.notifactionUrl);
      log("get completed");
      return await mapingData(response.data);
    } catch (e) {
      log("this is error meassage");
      log(e.toString());
      log("i will return empty list");
      return [];
    }
  }

  Future<List<NotifactionModel>> mapingData(data) async {
    log("Start maping\n this is the data");
    log(data.toString());
    List<NotifactionModel> notifactions = [];
    for (int i = 0; i < 10; i++) {
      log(i.toString());
      notifactions.add(NotifactionModel(
          iconUrl: determineIcon(data["data"][i]["type"]),
          message: data["data"][i]["message"],
          title: data["data"][i]["title"]));
    }
    log("this is data after maping");
    log(notifactions.toString());
    return notifactions;
  }
}

String determineIcon(String notificationType) {
  if (notificationType == "purchase") {
    return "assets/icons/wallet.svg";
  } else if (notificationType == "new_arrivals") {
    return "assets/icons/location.svg";
  } else if (notificationType == "discount") {
    return "assets/icons/discount.svg";
  } else if (notificationType == "special_offer") {
    return "assets/icons/discount.svg";
  } else {
    return "assets/icons/discount.svg";
  }
}
