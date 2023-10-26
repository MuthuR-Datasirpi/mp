import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/resources/resources.dart';

class AppLogo extends StatelessWidget {
  final Color? color;

  const AppLogo({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Drawables.appLogo,
      color: color ?? AppColors.primaryColor,
    );
  }
}
