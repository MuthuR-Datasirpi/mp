import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/common/widgets/icon_text.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/core/resources/drawables.dart';

class HomeScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String location;
  final VoidCallback? onLocationTapped;
  final VoidCallback? onNotificationTapped;
  final VoidCallback? onIconTapped;

  const HomeScreenAppBar(
      {Key? key,
      required this.location,
      this.onLocationTapped,
      this.onNotificationTapped,
      this.onIconTapped})
      : super(key: key);

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  bool isArrowUp = false;

  @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 150,
      leading: InkWell(
        onTap: () {
          if (widget.onLocationTapped != null) {
            widget.onLocationTapped!();
            setState(() {
              isArrowUp = !isArrowUp;
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.materialPadding),
          child: Row(
            children: [
              Row(
                children: [
                  IconText(
                    prefixIcon: SvgPicture.asset(
                      Drawables.locationPin,
                      width: 20,
                      height: 20,
                    ),
                    text: Text(widget.location,
                        style: context.textTheme.titleMedium),
                  ),
                  Icon(
                    isArrowUp
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.blackSecondary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: widget.onNotificationTapped,
          icon: const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
