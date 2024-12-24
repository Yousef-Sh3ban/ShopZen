import 'package:base/features/home_screen/domain/models/review_model.dart';

class ProductDetailsModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<ReviewModel> reviews;
  final List<String> images;
  final double oldPrice;
  final int reviewsCount;
  bool isFavorite;

  ProductDetailsModel(
      {required this.id,
      required this.category,
      required this.stock,
      required this.reviews,
      required this.images,
      required this.discountPercentage,
      required this.description,
      required this.title,
      required this.price,
      required this.oldPrice,
      required this.rating,
      required this.reviewsCount,
      required this.isFavorite});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(), 
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'],
      reviews: (json['reviews'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
      images: List<String>.from(json['images']),
      oldPrice: (json['price'] ?? 0.00).toDouble(),
      reviewsCount: ((json['reviews'] as List)
              .map((review) => ReviewModel.fromJson(review))
              .toList())
          .length,
      isFavorite:
          json['isFavorite'] ?? false, 
    );
  }
}
