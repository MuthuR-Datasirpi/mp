import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 0.5,
        child: CircularProgressIndicator(
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
