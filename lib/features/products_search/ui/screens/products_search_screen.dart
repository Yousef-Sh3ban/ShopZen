// import 'package:base/configurations/app_states.dart';
// import 'package:base/features/products_search/domain/models/product.dart';
// import 'package:base/features/products_search/ui/blocs/products_search_bloc.dart';
// import 'package:base/features/products_search/ui/widgets/categories_panel.dart';
// import 'package:base/features/products_search/ui/widgets/product_card_grid_view.dart';
// import 'package:base/features/products_search/ui/widgets/products_search_input_field.dart';
// import 'package:base/navigation/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../widgets/product_card_list_view.dart';

// class ProductsSearchScreen extends StatelessWidget {
//   const ProductsSearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
//         title: Text('Products Search'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ProductsSearchInputField(),
//                 ),
//                 SizedBox(width: 16),
//                 BlocBuilder<ProductsSearchBloc, AppStates>(
//                   buildWhen: (previous, current) => current is LoadedState,
//                   builder: (context, state) {
//                     var bloc = BlocProvider.of<ProductsSearchBloc>(context);
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColor,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: IconButton(
//                         icon: Icon(bloc.showGrid ? Icons.grid_on_outlined : Icons.list_alt_outlined),
//                         onPressed: () => bloc.toggleView(),
//                         color: Colors.white,
//                       ),
//                     );
//                   },
//                 )
//               ],
//             ),
//           ),
//           SizedBox(height: 16),
//           CategoriesPanel(),
//           SizedBox(height: 16),
//           Expanded(
//             child: BlocBuilder<ProductsSearchBloc, AppStates>(
//               builder: (context, state) {
//                 if (state is LoadingState)
//                   return Center(child: CircularProgressIndicator());
//                 else if (state is EmptyState)
//                   return Center(child: Text('No Products Found'));
//                 else if (state is ErrorState)
//                   return Center(child: Text("Error"));
//                 else if (state is LoadedState) {
//                   List<Product> products = state.data as List<Product>;
//                   var bloc = BlocProvider.of<ProductsSearchBloc>(context);
//                   if (bloc.showGrid) {
//                     return GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 16,
//                         crossAxisSpacing: 16,
//                       ),
//                       itemBuilder: (context, index) => GestureDetector(
//                         onTap: () => Navigator.of(context).pushNamed(AppRoutes.productDetails, arguments: products[index].id),
//                         child: ProductCardGridView(
//                           product: products[index],
//                         ),
//                       ),
//                       itemCount: products.length,
//                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                     );
//                   }

//                   return ListView.separated(
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                     itemCount: products.length,
//                     itemBuilder: (context, index) => GestureDetector(
//                       onTap: () => Navigator.of(context).pushNamed(AppRoutes.productDetails, arguments: products[index].id),
//                       child: ProductCardListView(
//                         product: products[index],
//                       ),
//                     ),
//                     separatorBuilder: (context, index) => SizedBox(height: 16),
//                   );
//                 } else
//                   return SizedBox();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
