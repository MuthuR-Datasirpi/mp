import 'package:flutter/material.dart';
import 'package:mobile/core/resources/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String buttonText;
  final Color buttonColor;
  final Color iconColor;
  final Color textColor;

  CustomTextButton({
    required this.onPressed,
    required this.iconData,
    required this.buttonText,
    this.buttonColor = Colors.blue,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Row(
          children: [
            Icon(iconData, color: iconColor),
            SizedBox(width: 8),
            Text(
              buttonText,
              style: AppStyles.medium14.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Custom Text Button"),
      ),
      body: Center(
        child: CustomTextButton(
          onPressed: () {
            // Add your custom button's action here
            print("Button Clicked");
          },
          iconData: Icons.add,
          buttonText: "Add New One",
          buttonColor: Colors.blue,
          iconColor: Colors.white,
          textColor: Colors.white,
        ),
      ),
    ),
  ));
}
