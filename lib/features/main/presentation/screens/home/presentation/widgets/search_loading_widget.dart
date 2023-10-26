import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:shimmer/shimmer.dart';

class SearchLoadingWidget extends StatelessWidget {
  const SearchLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return _buildShimmerContainer(context.deviceWidth, 60);
        },
      ),
    );
  }

  Widget _buildShimmerContainer(double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.padding_12),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.shimmerBaseColor,
        ),
      ),
    );
  }
}
