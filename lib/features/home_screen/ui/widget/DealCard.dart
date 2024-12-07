import 'package:base/configurations/app_events.dart';
import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviewsCount;
  bool isFavorite;

  DealCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviewsCount,
    required this.isFavorite,
  });

  @override
  State<DealCard> createState() => _DealCardState();
}

class _DealCardState extends State<DealCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  height: 120,
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
                      setState(() {
                        widget.isFavorite = !widget.isFavorite;
                      });
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
                              ? Color(0xFFDE1135)
                              : Color(0xFF323135)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                "\$${widget.price}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF323135),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "\$${widget.oldPrice}",
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
                    color: Color(0xFF68656E)),
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
        ],
      ),
    );
  }
}
