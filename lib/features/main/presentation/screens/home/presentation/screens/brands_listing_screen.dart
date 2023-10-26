import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/brands_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/categories_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/brand_listing_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/category_listing_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/brand_list_item.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/brand_listing_loading_widget.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/category_list_item.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/category_listing_loading_widget.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';

class BrandsListingScreen extends StatefulWidget {
  const BrandsListingScreen({Key? key, this.categoryId}) : super(key: key);

  final int? categoryId;

  @override
  State<BrandsListingScreen> createState() => _BrandsListingScreenState();
}

class _BrandsListingScreenState extends State<BrandsListingScreen> {
  @override
  void initState() {
    if (widget.categoryId == null) {
      context.read<BrandListingCubit>().getAllBrands();
    } else {
      context
          .read<BrandListingCubit>()
          .getBrandsByCategoryId(widget.categoryId!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandListingCubit, BrandListingScreenStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 24,
            title: Text(
              context.appStrings.brands,
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          body: state.whenOrNull(
              loading: () => const BrandListingLoadingWidget(),
              onError: (error) => Center(child: Text(error)),
              onAllBrandsFetched: (brands) => Padding(
                    padding: const EdgeInsets.all(Dimensions.materialPadding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.appStrings.selectABrand,
                            style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 16)),
                        const SizedBox(height: Dimensions.materialPadding),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (_, index) => BrandListItem(
                                  brand: brands[index],
                                  onTap: onBrandItemTapped),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: Dimensions.padding_20),
                              itemCount: brands.length),
                        )
                      ],
                    ),
                  )),
        );
      },
    );
  }

  void onBrandItemTapped(Brand brand) {
    context.push(PagePath.allPlans, extra: {"brandName":brand.title,"id":brand.id, });
  }
}
