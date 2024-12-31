class ProductModel {
  final int id;
  final String title;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviewsCount;
  final String thumbnail;
  final String brand;
  final bool isFavorite;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviewsCount,
    required this.thumbnail,
    required this.brand,
    required this.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      oldPrice: json['price'] * 1.5,
      rating: json['rating']?.toDouble() ?? 0.0,
      reviewsCount: json['reviewsCount'] ?? 0,
      thumbnail: json['thumbnail'],
      brand: json['brand'] ?? 'Unknown',
      isFavorite: false,
    );
  }
}
