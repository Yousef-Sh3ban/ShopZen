class ProductModel {
  final String imageUrl;
  final String title;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviewsCount;
  final bool isFavorite;
  ProductModel(
      {required this.imageUrl,
      required this.title,
      required this.price,
      required this.oldPrice,
      required this.rating,
      required this.reviewsCount,
      required this.isFavorite});
//=================================
//=================================
//=================================
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imageUrl: json['imageUrl'],
      title: json['title'],
      price: json['price'],
      oldPrice: json['oldPrice'],
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
//=================================
//=================================
//=================================
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'price': price,
      'oldPrice': oldPrice,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'isFavorite': isFavorite,
    };
  }
}
