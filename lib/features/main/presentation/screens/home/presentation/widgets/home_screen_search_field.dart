// import 'package:flutter/material.dart';
// import 'package:mobile/core/resources/colors.dart';
// import 'package:mobile/core/resources/dimens.dart';
//
// class HomeScreenSearchField extends StatefulWidget {
//   const HomeScreenSearchField({super.key});
//
//   @override
//   State<HomeScreenSearchField> createState() => _HomeScreenSearchFieldState();
// }
//
// class _HomeScreenSearchFieldState extends State<HomeScreenSearchField> {
//   final searchFieldController = TextEditingController();
//
//   @override
//   void dispose() {
//     searchFieldController.dispose();
//     super.dispose();
//   }
//
//   void onPressedSearchField() {}
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverPersistentHeader(
//       pinned: true,
//       delegate: PersistentHeader(
//         isBorderVisible: false,
//         height: 80,
//         widget: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: Dimensions.materialPadding,
//           ),
//           child: SearchTextField(
//             controller: searchFieldController,
//             hintText: context.appStrings.search_for_restaurant_cuisine,
//             searchHintStyle: context.textTheme.titleMedium
//                 ?.copyWith(fontWeight: FontWeight.w400, fontSize: 18),
//             readOnly: true,
//             onTap: onPressedSearchField,
//             suffixIcon: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: Dimensions.materialPadding_24,
//                   child: VerticalDivider(
//                     thickness: 2,
//                     color: AppColors.textLightColor,
//                   ),
//                 ),
//                 Image.asset(
//                   Drawables.searchFieldFilterIcon,
//                   height: Dimensions.padding_26,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PersistentHeader extends SliverPersistentHeaderDelegate {
//   final Widget widget;
//   final bool isBorderVisible;
//   final double height;
//   PersistentHeader(
//       {required this.widget, this.isBorderVisible = true, this.height = 96.0});
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       width: double.infinity,
//       height: height,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: isBorderVisible
//             ? Border(
//                 bottom: BorderSide(
//                   width: 1,
//                   color: AppColors.separatorTextColor,
//                 ),
//               )
//             : null,
//       ),
//       child: Center(child: widget),
//     );
//   }
//
//   @override
//   double get maxExtent => height;
//
//   @override
//   double get minExtent => height;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
