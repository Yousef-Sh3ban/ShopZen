import '../models/notifaction_model.dart';

abstract class GetNotifactionRepoInterface {
  Future<List<NotifactionModel>> getNotifaction();
}
