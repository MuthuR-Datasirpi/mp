import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final bool isBorderVisible;
  final double height;

  PersistentHeader(
      {required this.widget, this.isBorderVisible = true, this.height = 96.0});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: isBorderVisible
            ? Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.separatorColor,
          ),
        )
            : null,
      ),
      child: Center(child: widget),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}