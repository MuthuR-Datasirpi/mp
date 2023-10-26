import 'package:flutter/material.dart';
import 'package:mobile/core/resources/resources.dart';

// Custom AddressDetailsScreenLoading widget that extends StatefulWidget
class AddressDetailsScreenLoading extends StatefulWidget {
  // Constructor to initialize the AddressDetailsScreenLoading widget
  const AddressDetailsScreenLoading({super.key});

  // Creating a state for the AddressDetailsScreenLoading widget
  @override
  State<AddressDetailsScreenLoading> createState() => _AddressDetailsScreenLoadingState();
}

// State class for the AddressDetailsScreenLoading widget
class _AddressDetailsScreenLoadingState extends State<AddressDetailsScreenLoading> {
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
