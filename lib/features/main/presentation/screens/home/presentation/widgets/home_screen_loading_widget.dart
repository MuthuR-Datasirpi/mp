import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenLoadingWidget extends StatelessWidget {
  const HomeScreenLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView(
        children: [
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(10, (index) => _buildShimmerContainer(90, 120))
              ],
            ),
          ),
          _buildShimmerContainer(context.deviceWidth, 100),
          _buildShimmerContainer(context.deviceWidth, 150),
          _buildShimmerContainer(context.deviceWidth, 200),
          _buildShimmerContainer(context.deviceWidth, 200),
          _buildShimmerContainer(context.deviceWidth, 200),
          _buildShimmerContainer(context.deviceWidth, 200)
        ],
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
