import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/dimens.dart';
class CustomAppBar extends StatelessWidget {
  final String title;
   CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.padding_26, vertical: Dimensions.padding_10),
      alignment: Alignment.center,
      height: 54,
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-5, 0),
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(5, 0),
        )
      ], color: Colors.white),
      child: Container(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.padding_14),
              child: Text(
                this.title,
                style:context.textTheme.titleMedium?.copyWith(fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
