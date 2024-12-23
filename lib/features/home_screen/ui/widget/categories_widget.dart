import 'package:base/features/home_screen/ui/blocs/category_cubit.dart';
import 'package:base/features/home_screen/ui/screen/categories_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesWidget extends StatelessWidget {
  Response response;
  CategoriesWidget({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = modelingCategories(response);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("View All",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map(
              (category) {
                return Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => CategoryCubit(),
                                  child: CategoriesScreen(
                                    title: category["name"]!,
                                    categoryurl: category["categoryurl"]!,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFEBEFFF),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              category["icon"]!,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: Center(
                            child: Text(
                              category["name"]!,
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF57545B)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    category["name"] !=
                            categories[categories.length - 1]["name"]
                        ? const SizedBox(
                            width: 16,
                          )
                        : const SizedBox()
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}

List<Map<String, String>> modelingCategories(Response response) {
  List<Map<String, String>> categories = (response.data as List)
      .map((json) => {
            "name": json["name"] as String,
            "icon": _determineIcon(json["name"]),
            "categoryurl": json["url"] as String
          })
      .toList();
  return categories;
}

String _determineIcon(String categorieType) {
  if (categorieType == "Beauty") {
    return "assets/icons/dress.svg";
  } else if (categorieType == "Furniture") {
    return "assets/icons/Living.svg";
  } else if (categorieType == "Groceries") {
    return "assets/icons/Groceries.svg";
  } else if (categorieType == "Home Decoration") {
    return "assets/icons/Living.svg";
  } else if (categorieType == "Mens Shirts") {
    return "assets/icons/dress.svg";
  } else if (categorieType == "Sports Accessories") {
    return "assets/icons/fitness.svg";
  } else {
    return "assets/icons/Groceries.svg";
  }
}
