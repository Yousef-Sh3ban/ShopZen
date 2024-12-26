class NotifactionModel {
  final String iconUrl;
  final String title;
  final String message;

  NotifactionModel(
      {required this.iconUrl, required this.title, required this.message});
  factory NotifactionModel.fromJson(Map<String, dynamic> json) {
    return NotifactionModel(
      title: json['title'],
      message: json['message'],
      iconUrl: determineIcon(json['type']),
    );
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
