import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/brand_list_item.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/home_category_list_item_widget.dart';

class HomeTrendingBrandListingWidget extends StatelessWidget {
  const HomeTrendingBrandListingWidget(
      {Key? key, required this.brands, required this.onTap})
      : super(key: key);

  final List<Brand> brands;
  final Function(Brand brand) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => SizedBox(
              width: context.deviceWidth * 0.7,
              child: BrandListItem(brand: brands[index], onTap: onTap)),
          separatorBuilder: (context, index) =>
              const SizedBox(width: Dimensions.materialPadding),
          itemCount: brands.length),
    );
  }
}
