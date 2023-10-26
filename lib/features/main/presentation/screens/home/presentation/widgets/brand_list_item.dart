import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/custom_network_image.dart';
import 'package:mobile/common/widgets/icon_text.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class BrandListItem extends StatelessWidget {
  const BrandListItem({Key? key, required this.brand, required this.onTap})
      : super(key: key);

  final Brand brand;
  final Function(Brand brand) onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          onTap.call(brand);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: CustomNetworkImage(
                imageUrl: brand.imageUrl,
                width: context.deviceWidth,
                height: 172,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.padding_8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(brand.title.toString(),
                          style: context.textTheme.titleMedium),
                      IconText(
                          prefixIcon: const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          text: Text(brand.rating.toString(),
                              style: context.textTheme.titleSmall
                                  ?.copyWith(color: AppColors.inputLabelColor)))
                    ],
                  ),
                  Column(
                    children: [
                      Text(context.appStrings.starting_from,
                          style: context.textTheme.titleSmall?.copyWith(
                              fontStyle: FontStyle.italic,
                              color: AppColors.inputLabelColor)),
                      Text(
                          //TODO:Currency Identifier 'AED' should be received from BE
                          'AED${brand.minAmountPerDay}/${context.appStrings.day}',
                          style: context.textTheme.titleSmall?.copyWith(
                              color: AppColors.inputLabelColor,
                              fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
