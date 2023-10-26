import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/custom_text_form_field.dart';
import 'package:mobile/common/widgets/persistent_header.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class HomeScreenSearchField extends StatefulWidget {
  const HomeScreenSearchField({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<HomeScreenSearchField> createState() => _HomeScreenSearchFieldState();
}

class _HomeScreenSearchFieldState extends State<HomeScreenSearchField> {
  final searchFieldController = TextEditingController();

  @override
  void dispose() {
    searchFieldController.dispose();
    super.dispose();
  }

  void onPressedSearchField() {}

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: PersistentHeader(
          isBorderVisible: false,
          height: 80,
          widget: GestureDetector(
            onTap: widget.onTap,
            child: CustomTextFormField(
              enabled: false,
              prefixIcon:
                  const Icon(Icons.search, color: AppColors.primaryBlack),
              controller: TextEditingController(),
              hintText: context.appStrings.searchBrandCategoryorIngredient,
              hintStyle: context.textTheme.titleSmall
                  ?.copyWith(color: AppColors.textLightColor),
            ),
          )),
    );
  }
}
