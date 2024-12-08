import 'package:base/configurations/app_states.dart';
import 'package:base/features/products_search/domain/models/category.dart';
import 'package:base/features/products_search/ui/blocs/products_categories_bloc.dart';
import 'package:base/features/products_search/ui/blocs/products_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPanel extends StatefulWidget {
  const CategoriesPanel({super.key});

  @override
  State<CategoriesPanel> createState() => _CategoriesPanelState();
}

class _CategoriesPanelState extends State<CategoriesPanel> {
  bool isSelected(int id, BuildContext context) {
    var productsSearchBloc = BlocProvider.of<ProductsSearchBloc>(context);
    if (productsSearchBloc.selectedCategoryFilter != null) {
      return productsSearchBloc.selectedCategoryFilter!.id == id;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<ProductsCategoriesBloc, AppStates>(
        builder: (context, state) {
          if(state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if(state is ErrorState)
            return const Center(child: Text("Error"));
          else if(state is EmptyState)
            return const Center(child: Text('No Categories'));
          else if(state is LoadedState){
            List<Category> categories = state.data as List<Category>;

            return ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    BlocProvider.of<ProductsSearchBloc>(context)
                        .filterByCategory(categories[index]);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isSelected(categories[index].id, context)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Image.network(categories[index].imageUrl, width: 24, height: 24, fit: BoxFit.cover),
                      const SizedBox(width: 8),
                      Text(categories[index].name),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
