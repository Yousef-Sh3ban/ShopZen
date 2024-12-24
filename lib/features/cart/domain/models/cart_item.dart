class CartItem {
  final int id;
  final String title;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
    };
  }
}
