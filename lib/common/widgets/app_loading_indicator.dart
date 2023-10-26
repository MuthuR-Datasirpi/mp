import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';

// Custom AppLoadingIndicator widget that extends StatefulWidget
class AppLoadingIndicator extends StatefulWidget {
  // Constructor to initialize the AppLoadingIndicator widget
  const AppLoadingIndicator({super.key});

  // Creating a state for the AppLoadingIndicator widget
  @override
  State<AppLoadingIndicator> createState() => _AppLoadingIndicatorState();
}

// State class for the AppLoadingIndicator widget
class _AppLoadingIndicatorState extends State<AppLoadingIndicator> {
  // Build method to define how the loading indicator widget should be displayed
  @override
  Widget build(BuildContext context) {
    // Returns a Column widget containing the loading indicator at the center of the column
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.all(5),
            child: const CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation(AppColors.inputBorderColor),
            ),
          ),
        ),
      ],
    );
  }
}
