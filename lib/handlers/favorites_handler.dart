import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';

class FavoritesHandler {
  static const String _favoritesKey = 'favorites';

  static Future<void> addFavorite(ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritesList = prefs.getStringList(_favoritesKey) ?? [];
    String productJson = json.encode(product.toJson());
    favoritesList.add(productJson);
    await prefs.setStringList(_favoritesKey, favoritesList);
  }

  static Future<void> removeFavorite(String productTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritesList = prefs.getStringList(_favoritesKey) ?? [];
    favoritesList.removeWhere((productJson) {
      Map<String, dynamic> productMap = json.decode(productJson);
      return productMap['title'] == productTitle;
    });
    await prefs.setStringList(_favoritesKey, favoritesList);
  }

  static Future<List<ProductModel>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritesList = prefs.getStringList(_favoritesKey) ?? [];
    return favoritesList
        .map((productJson) => ProductModel.fromJson(json.decode(productJson)))
        .toList();
  }

  static Future<bool> isFavorite(String productTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritesList = prefs.getStringList(_favoritesKey) ?? [];
    for (var productJson in favoritesList) {
      Map<String, dynamic> productMap = json.decode(productJson);
      if (productMap['title'] == productTitle) {
        return true;
      }
    }
    return false;
  }
}
