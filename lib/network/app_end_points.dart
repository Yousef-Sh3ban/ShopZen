abstract class AppEndPoints {
  static const String baseUrl = "https://dummyjson.com/";
  
  static const String apiKey = "2f4b89b9da7a48889d3615dde4f8bd6f";
  static const String productsSearch = "products";
  static String productsDetails(String id) => "products/$id";
  static const String categories = "categories";
  //todo: Add more endpoints
}
