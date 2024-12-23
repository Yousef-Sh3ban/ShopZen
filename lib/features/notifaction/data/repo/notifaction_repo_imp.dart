
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
      return await mapingData(response.data);
    } catch (e) {
      return [];
    }
  }

  Future<List<NotifactionModel>> mapingData(data) async {
    List<NotifactionModel> notifactions = (data['data'] as List)
        .map((json) => NotifactionModel.fromJson(json))
        .toList();
    // for (int i = 0; i < 10; i++) {
    //   log(i.toString());
    //   notifactions.add(NotifactionModel(
    //       iconUrl: determineIcon(data["data"][i]["type"]),
    //       message: data["data"][i]["message"],
    //       title: data["data"][i]["title"]));
    // }
    return notifactions;
  }
}
