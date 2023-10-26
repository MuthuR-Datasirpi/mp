import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/custom_network_image.dart';
import 'package:mobile/core/resources/dimens.dart';

class HomeCategoryListItemWidget extends StatelessWidget {
  const HomeCategoryListItemWidget(
      {Key? key, required this.imageUrl, required this.title, this.onTap})
      : super(key: key);

  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomNetworkImage(
              width: 90,
              height: 90,
              imageUrl: imageUrl,
              fit: BoxFit.cover
            ),
          ),
          const SizedBox(height: Dimensions.padding_8),
          SizedBox(
              width: 90,
              child: Text(title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 12)))
        ],
      ),
    );
  }
}
