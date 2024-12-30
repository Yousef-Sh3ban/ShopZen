class ProductModel {
  final int id;
  final String imageUrl;
  final String title;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviewsCount;
  bool isFavorite;
  ProductModel(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.oldPrice,
      required this.rating,
      required this.reviewsCount,
      required this.isFavorite});
//=================================
//=================================
//=================================
  factory ProductModel.fromJsonForDB(Map<String, dynamic> json) {
    //This is only for the datbase don't try to use it for API or anoter thing becuse the name of the keys is made only for the database
    return ProductModel(
      id: json['id'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      title: json['title'] ?? 'No Title',
      price: (json['price'] ?? 0.0).toDouble(),
      oldPrice: (json['oldPrice'] ?? 0.0).toDouble(),
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewsCount: (json['reviewsCount'] ?? 0).toInt(),
      isFavorite: json['isFavorite'] == 1,
    );
  }

//=================================
//=================================
//=================================
  Map<String, dynamic> toJson() {
    //This is only for the datbase don't try to use it for API or anoter thing becuse the name of the keys is made only for the database
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'price': price,
      'oldPrice': oldPrice,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }
}
