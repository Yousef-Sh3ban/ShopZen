class OrderModel {
  double total;
  double discountedTotal;
  int quantity;
  OrderModel({
    required this.discountedTotal,
    required this.quantity,
    required this.total,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        discountedTotal: json["discountedTotal"],
        quantity: json["quantity"],
        total: json["total"]);
  }
}
