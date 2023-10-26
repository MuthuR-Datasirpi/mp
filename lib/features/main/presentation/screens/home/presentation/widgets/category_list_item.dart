import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/custom_network_image.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem(
      {Key? key, required this.category, required this.onTap})
      : super(key: key);

  final Category category;
  final Function(Category category) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call(category);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomNetworkImage(
              imageUrl: category.imageUrl,
              width: 65,
              height: 65,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title.toString(),
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: Dimensions.padding_6,
                  ),
                  Text(
                    category.description.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.labelMedium?.copyWith(
                        fontSize: 12, color: AppColors.inputLabelColor),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.textLightColor,size: 20),
        ],
      ),
    );
  }
}
