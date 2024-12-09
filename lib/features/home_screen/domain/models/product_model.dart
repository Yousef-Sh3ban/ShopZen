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
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imageUrl: json['images'][0],
      title: json['title'],
      price: (json['price']).toDouble(),
      oldPrice: (json['price']).toDouble() * 2,
      rating: (json['rating']).toDouble(),
      reviewsCount: (json['reviews']).length,
      isFavorite: false,
    );
  }
}
