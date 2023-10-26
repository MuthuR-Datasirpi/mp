import 'package:flutter/material.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/home_category_list_item_widget.dart';

class HomeCategoryListingWidget extends StatelessWidget {
  const HomeCategoryListingWidget(
      {Key? key, required this.categories, required this.onTap})
      : super(key: key);

  final List<Category> categories;
  final Function(Category category) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categories[index];
            return HomeCategoryListItemWidget(
                onTap: () {
                  onTap.call(category);
                },
                title: category.title.toString(),
                imageUrl: category.imageUrl ?? '');
          },
          separatorBuilder: (context, index) => const SizedBox(width: Dimensions.materialPadding),
          itemCount: categories.length),
    );
  }
}
