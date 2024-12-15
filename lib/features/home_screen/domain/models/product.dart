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
}
