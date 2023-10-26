import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/custom_network_image.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/sample_menu_response.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class SampleMenuListItemWidget extends StatelessWidget {
  const SampleMenuListItemWidget({Key? key, required this.menuGroup})
      : super(key: key);

  final MenuGroup menuGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMenuGroupTitleWidget(context, menuGroup.name),
        const SizedBox(height: Dimensions.materialPadding),
        ...menuGroup.sampleMenuItems
            .map((menuItem) => _buildMenuGroupItemWidget(context, menuItem))
            .toList()
      ],
    );
  }

  Widget _buildMenuGroupTitleWidget(BuildContext context, String groupTitle) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.backGroundGreen,
          borderRadius: BorderRadius.circular(4)),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.materialPadding),
            child: Text(groupTitle, style: context.textTheme.titleMedium),
          )),
    );
  }

  Widget _buildMenuGroupItemWidget(BuildContext context, MenuItem item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name,
                  style: context.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: Dimensions.padding_8),
              Text(item.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: context.textTheme.titleSmall?.copyWith(
                      fontSize: 12,
                      color: AppColors.blackSecondary,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: Dimensions.padding_8),
              Text(getFormatNutrientsString(context, item),
                  style: context.textTheme.titleSmall?.copyWith(
                      fontSize: 12,
                      color: AppColors.textLightColor,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const SizedBox(width: Dimensions.padding_8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CustomNetworkImage(
            imageUrl: item.imageUrl,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  String getFormatNutrientsString(BuildContext context, MenuItem item) {
    return [
      '${context.appStrings.carbs} ${item.carbs}',
      '${context.appStrings.fats} ${item.fats}',
      '${context.appStrings.proteins} ${item.proteins}',
      '${context.appStrings.calories} ${item.calories}',
    ].join(' | ');
  }
}
