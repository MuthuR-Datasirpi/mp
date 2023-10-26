import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.backgroundWhiteColor,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.primaryBlack,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            title,
            style: AppStyles.heading2.copyWith(color: AppColors.primaryBlack),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
