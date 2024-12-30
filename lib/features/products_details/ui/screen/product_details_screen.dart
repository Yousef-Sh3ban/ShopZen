import 'package:animate_do/animate_do.dart';
import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/handlers/snackbars_handler.dart';
import 'package:base/handlers/vibration_handler.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
import 'package:base/features/cart/domain/models/cart_item.dart';
import 'package:base/features/products_details/domain/models/product_details_model.dart';
import 'package:base/features/products_details/ui/blocs/product_details_cubit.dart';
import 'package:base/features/products_details/ui/widget/descreption_widget.dart';
import 'package:base/features/products_details/ui/widget/favorite_icon_widget.dart';
import 'package:base/features/products_details/ui/widget/product_image_widget.dart';
import 'package:base/handlers/cart_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedImage;
  void initState() {
    super.initState();
    var productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    productDetailsCubit.getProductDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SettingsCubit.instance.isDarkMode
          ? const Color.fromARGB(29, 255, 255, 255)
          : Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        leading: FadeInDown(
          duration: const Duration(milliseconds: 700),
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        title: FadeInDown(
            duration: const Duration(milliseconds: 700),
            child: const Text("Product Details")),
      ),
      body: BlocBuilder<ProductDetailsCubit, AppStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Text("Error"),
            );
          } else if (state is LoadedState) {
            ProductDetailsModel productDetails =
                (state.data as ProductDetailsModel);
            selectedImage ??= productDetails.images[0];
            return FadeIn(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 260,
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 32,
                                child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: FavoriteIcon(
                                      productDetails: productDetails,
                                      productId: productDetails.id,
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                ProductImageWidget(
                                  images: productDetails.images,
                                  onImageSelected: (String image) {
                                    setState(
                                      () {
                                        selectedImage = image;
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  productDetails.title,
                                  style: const TextStyle(
                                      fontFamily: "Satoshi",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${productDetails.price}\$",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    SvgPicture.asset("assets/icons/star.svg"),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(productDetails.rating.toString()),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "(${productDetails.reviewsCount} Review)",
                                      style: const TextStyle(
                                          color: Color(0xFF68656E),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          DescreptionWidget(
                            description: productDetails.description,
                            reviews: productDetails.reviews,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: LoginBottom(
                      ontap: () {
                        triggerVibration(duration: 400);
                        final dbHelper = CartDatabaseHelper.instance;
                        dbHelper.insertCartItem(CartItem(
                            id: productDetails.id,
                            title: productDetails.title,
                            image: productDetails.images[0],
                            price: productDetails.price));
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(successSnackBar(
                              " ${productDetails.title} is now in your cart! 🛒"));
                      },
                      color: const Color(0xFF6A70FF),
                      text: "Add to Cart",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("NO DATA"),
            );
          }
        },
      ),
    );
  }
}
