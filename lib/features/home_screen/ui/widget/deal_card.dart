import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/app/functions/max_two_diget.dart';
import 'package:base/features/products_details/ui/blocs/product_details_cubit.dart';
import 'package:base/features/products_details/ui/screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base/app/models/product_model.dart';
import 'package:base/handlers/favorite_handler.dart';

class DealCard extends StatefulWidget {
  final int id;
  final String imageUrl;
  final String title;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviewsCount;
  bool isFavorite;
  final Function(bool)? onFavoriteChanged;

  DealCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviewsCount,
    required this.isFavorite,
    this.onFavoriteChanged,
  });

  @override
  State<DealCard> createState() => _DealCardState();
}

final dbHelper = DBHelper.instance;

class _DealCardState extends State<DealCard> {
  @override
  void initState() {
    super.initState();
    dbHelper.isProductFavorite(widget.id).then(
      (isFav) {
        setState(
          () {
            widget.isFavorite = isFav;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: SettingsCubit.instance.isDarkMode
              ? const Color.fromARGB(2, 255, 255, 255)
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.imageUrl,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      shape: BoxShape.rectangle,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        setState(
                          () {
                            widget.isFavorite = !widget.isFavorite;
                          },
                        );
                        if (widget.isFavorite) {
                          dbHelper.insertProduct(ProductModel(
                            id: widget.id,
                            imageUrl: widget.imageUrl,
                            title: widget.title,
                            price: widget.price,
                            oldPrice: widget.oldPrice,
                            rating: widget.rating,
                            reviewsCount: widget.reviewsCount,
                            isFavorite: widget.isFavorite,
                          ));
                        } else {
                          dbHelper.deleteProduct(widget.id);
                        }

                        if (widget.onFavoriteChanged != null) {
                          widget.onFavoriteChanged!(widget.isFavorite);
                        }
                      },
                      color: Colors.white,
                      child: Transform.translate(
                        offset: const Offset(-12, 0),
                        child: Icon(
                            size: 15,
                            widget.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: widget.isFavorite
                                ? const Color(0xFFDE1135)
                                : const Color(0xFF323135)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "\$${truncateToTwoDecimalPlaces(widget.price)}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "\$${truncateToTwoDecimalPlaces(widget.oldPrice)}",
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF68656E),
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Color(0xFF68656E)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/star.svg",
                  height: 21.5,
                  width: 21.5,
                ),
                const SizedBox(width: 8),
                Text(
                  "${widget.rating}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "(${widget.reviewsCount})",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF68656E)),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ProductDetailsCubit(),
              child: ProductDetailsScreen(
                id: widget.id,
              ),
            ),
          ),
        );
      },
    );
  }
}
