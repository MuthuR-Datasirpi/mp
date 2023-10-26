import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/categories_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/category_listing_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/category_list_item.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/category_listing_loading_widget.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';

class CategoriesListingScreen extends StatefulWidget {
  const CategoriesListingScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesListingScreen> createState() =>
      _CategoriesListingScreenState();
}

class _CategoriesListingScreenState extends State<CategoriesListingScreen> {
  @override
  void initState() {
    context.read<CategoryListingCubit>().getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListingCubit, CategoryListingScreenStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 24,
            title: Text(
              context.appStrings.categories,
            ),
            // title: Text(
            //   context.appStrings.categories,
            //   style: context.textTheme.titleMedium
            //       ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
            // ),
          ),
          body: state.whenOrNull(
              loading: () => const CategoryListingLoadingWidget(),
              onError: (error) => Center(child: Text(error)),
              onAllCategoriesFetched: (categories) => Padding(
                    padding: const EdgeInsets.all(Dimensions.materialPadding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.appStrings.selectACategory,
                            style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 16)),
                        const SizedBox(height: Dimensions.materialPadding),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (_, index) => CategoryListItem(
                                  category: categories[index],
                                  onTap: onCategoryItemTapped),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                      color: AppColors.dividerColor,
                                      thickness: 1),
                              itemCount: categories.length),
                        )
                      ],
                    ),
                  )),
        );
      },
    );
  }

  void onCategoryItemTapped(Category category) {}
}
