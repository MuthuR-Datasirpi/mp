import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/widgets/app_input.dart';
import 'package:mobile/common/widgets/auto_open_field.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/resources.dart';
import 'package:mobile/features/profile/data/models/name_request_model.dart';
import 'package:mobile/features/profile/presentation/cubit/first_last_name_cubit.dart';
import 'package:mobile/features/profile/presentation/states/first_last_name_screen_states.dart';
import 'package:mobile/common/widgets/app_button.dart';
import 'package:mobile/constants/common_constants.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => NameState();
}

class NameState extends State<NameScreen> with WidgetsBindingObserver {
  late Map<String, dynamic>? routeArguments;
  bool isProgressing = false;

  // Controllers for inputs
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  // Variables for error message
  String firstNameErrorMsg = "";
  String lastNameErrorMsg = "";

  double marginSize = AppConstants.marginSize;

  // Returns boolean - to check firstname and lastname is not empty
  bool get isNamesNotEmpty =>
      firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty;

  // Returns boolean - to check input contains numbers
  final FocusNode firstNameFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameFocusNode.requestFocus();


  }

  bool isNameContainsNumbers(String input) {
    return input.contains(RegExp(ValidationConstants.REGEX_IS_DIGIT));
  }

  // Set the boolean isProgressing
  setIsProgressing(bool value) {
    setState(() {
      isProgressing = value;
    });
  }

  // Function for on first name changed
  _onFirstNameChanged(String value) {
    setState(() {
      firstNameErrorMsg = "";
    });

    if (isNameContainsNumbers(value)) {
      setState(() {
        firstNameErrorMsg = context.appStrings.firstNameErrorMessageAlphabets;
      });
      return;
    }
    if (value.isNotEmpty && value.length < 3) {
      setState(() {
        firstNameErrorMsg = context.appStrings.firstNameErrorMessageMinLength3;
      });
      return;
    }
  }

  // Function for on last name changed
  _onLastNameChanged(String value) {
    setState(() {
      lastNameErrorMsg = "";
    });

    if (isNameContainsNumbers(value)) {
      setState(() {
        lastNameErrorMsg = context.appStrings.lastNameErrorMessageAlphabets;
      });
      return;
    }
  }

  // Function to handle the save name process
  _saveName() async {
    if (firstNameController.text.isEmpty || lastNameController.text.isEmpty) {
      return;
    }
    setIsProgressing(true);

    final NameRequestModel payload = NameRequestModel(
      firstNameController.text,
      lastNameController.text,
    );
    context.read<NameCubit>().addName(payload);
  }

  // Return a widget with validation message
  Widget getValidationMessage(String message) {
    return message.isNotEmpty
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
            child: Text(
              message,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          )
        : const Text("");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(automaticallyImplyLeading: false),
          // Body
          body: LayoutBuilder(
            builder: (context, constraints) {
              double parentHeight = constraints.maxHeight;
              // Parent container
              return Container(
                margin: EdgeInsets.only(
                  left: marginSize,
                  right: marginSize,
                ),
                // Column widget
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.appStrings.enterNamePageTitle,
                          style: context.textTheme.titleMedium?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(height: parentHeight * 0.05),
                        // Container with TextField for first name input
                        AutoOpenField(
                          label: context.appStrings.firstNameLabel,
                          focusNode: firstNameFocusNode,
                          height: 60,
                          
                          controller: firstNameController,
                          onChanged: (val) => _onFirstNameChanged(val),
                        ),
                        getValidationMessage(firstNameErrorMsg),
                        firstNameErrorMsg.isEmpty
                            ? SizedBox(height: parentHeight * 0.01)
                            : const SizedBox(height: 0),
                        // Container with TextField for last name input
                        AppInput(
                          label: context.appStrings.lastNameLabel,
                          height: 60,
                          controller: lastNameController,
                          onChanged: (val) => _onLastNameChanged(val),
                        ),
                        getValidationMessage(lastNameErrorMsg),
                      ],
                    ),
                    // Block listener
                    BlocListener<NameCubit, NameScreenStates>(
                      listener: (context, state) {
                        state.maybeWhen(
                          loading: () => setIsProgressing(true),
                          onNameSaved: ((response) {
                            setIsProgressing(false);
                            context.push(PagePath.citySelectScreen);
                          }),
                          onError: ((error) {
                            setIsProgressing(false);
                          }),
                          orElse: () {
                            setIsProgressing(false);
                          },
                        );
                      },
                      child: const Text(""),
                    ),
                    // Container with a button to continue the save name process
                    Container(
                      margin: EdgeInsets.only(bottom: parentHeight * 0.1),
                      child: AppButton(
                          isLoading: isProgressing,
                          onPressed: 
                           (isNamesNotEmpty && !isProgressing)
                              ? _saveName
                              : null,
                          bgColor: AppColors.btnBgColor,
                          body: FittedBox(
                            child: Text(
                              context.appStrings.btnTextNext,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        onWillPop: () async {
          // Prevent pop back
          return false;
        });
  }
}
