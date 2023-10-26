import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListingLoadingWidget extends StatelessWidget {
  const CategoryListingLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(Dimensions.padding_12),
            leading: _buildShimmerContainer(65, 65),
            title: _buildShimmerContainer(context.deviceWidth, 40),
            subtitle: _buildShimmerContainer(context.deviceWidth, 20),
          );
        },
      ),
    );
  }

  Widget _buildShimmerContainer(double width, double height) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.shimmerBaseColor,
      ),
    );
  }
}
