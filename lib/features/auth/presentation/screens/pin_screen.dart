import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/features/auth/data/models/auth_payload_model.dart';
import 'package:mobile/features/auth/presentation/cubit/pin_screen_cubit.dart';
import 'package:mobile/features/auth/presentation/states/pin_screen_states.dart';
import 'package:mobile/common/widgets/app_button.dart';
import 'package:mobile/common/widgets/app_loading_indicator.dart';
import 'package:mobile/constants/common_constants.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key, this.params});

  final Map<String, dynamic>? params;

  @override
  State<PinScreen> createState() => _PinScreen();
}

class _PinScreen extends State<PinScreen> {
  // Variables
  late List<String> pinInputs = [];
  final int pinDigit = AuthConstants.PIN_DIGIT;
  late int currentPinIndex = 0;
  bool isRegisterPage = false;
  bool isForgotPinPage = false;
  Color pinObscureTextColor = AppColors.pinHintColor;
  bool isSubmiting = false;
  int countdownSeconds = AuthConstants.PIN_TRY_AFTER_SECONDS;
  Timer? timer;
  bool isTimerStarted = false;
  int noOfAttempts = 3;
  bool showNoOfAttemptsLeft = false;

// Function to start the timer
  void startTimer() {
    isTimerStarted = true;
    // Create a Timer that runs every second and updates the countdown
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdownSeconds--;
      });

      if (countdownSeconds <= 0) {
        // Stop the timer when the countdown is complete
        timer.cancel();
        setState(() {
          isTimerStarted = false;
          countdownSeconds = AuthConstants.PIN_TRY_AFTER_SECONDS;
        });
      }
    });
  }

  // Getter returns the boolean if all pins were entered or not
  get isPinEntered => pinInputs.every((pinInput) => pinInput.isNotEmpty);

  // Returns boolean is Register Or is Forgot pin page
  get isRegisterOrForgotPinPage => isRegisterPage || isForgotPinPage;

  // Function to initialize the PIN properties
  _initPin() {
    currentPinIndex = 0;
    pinInputs = [];
    // Initialize the list with empty strings to hold PIN digits
    for (int i = 0; i < pinDigit; i++) {
      pinInputs.add("");
    }
  }

  @override
  void initState() {
    super.initState();
    _initPin();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // Function to add a PIN digit
  addPin(int pin) async {
    if (currentPinIndex < pinDigit) {
      setState(() {
        pinInputs[currentPinIndex] = pin.toString();
        currentPinIndex++;
      });
    }
    if (!(isRegisterOrForgotPinPage) && isPinEntered) {
      await _submitPin();
    }
  }

  // Function to remove a PIN digit
  removePin() {
    if (currentPinIndex != 0) {
      setState(() {
        currentPinIndex--;
        pinInputs[currentPinIndex] = "";
      });
    }
  }

  // Set the boolean isSubmiting
  setIsSubmiting(bool value) {
    setState(() {
      isSubmiting = value;
    });
  }

  // Function to submit the PIN for verification
  _submitPin() async {
    setIsSubmiting(true);
    final mobileNumber = widget.params?["mobileNumber"];
    final countryDailCode = widget.params?["countryDailCode"];
    final String pinValue = pinInputs.join();
    final LoginRequestModel payload = LoginRequestModel(
        int.parse(pinValue), "+$countryDailCode", mobileNumber);
    if (isRegisterPage) {
      context.read<PinScreenCubit>().setPin(payload);
    } else if (isForgotPinPage) {
      context.read<PinScreenCubit>().resetPin(payload);
    } else {
      context.read<PinScreenCubit>().login(payload, !isRegisterOrForgotPinPage);
    }
  }

  Widget _getPinInputUI(String input) {
    if (isRegisterOrForgotPinPage) {
      return Container(
        width: 32,
        padding: const EdgeInsets.all(12), // Optional padding
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: input.isNotEmpty
                  ? AppColors.hyperLinkColor
                  : pinObscureTextColor, // Border color
              width: 2, // Border width
            ),
          ),
        ),
        child: Text(input,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: input.isNotEmpty
                  ? AppColors.hyperLinkColor
                  : pinObscureTextColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            )),
      );
    }
    return Icon(
      size: 16,
      Icons.circle,
      color: input.isNotEmpty ? AppColors.primaryColor : pinObscureTextColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Here, the build method constructs the UI of the PinScreen screen.
    // It includes a PIN input area, number keys, and a submit button.
    const double marginSize = AppConstants.marginSize;
    isRegisterPage = widget.params?["isRegisterPage"] ?? false;
    isForgotPinPage = widget.params?["isForgotPinPage"] ?? false;

    String attemptsString = context.appStrings.attempts;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: LayoutBuilder(builder: (context, constraints) {
            double parentWidth = constraints.maxWidth;
            double parentHeight = constraints.maxHeight;

            // Function to get the PIN number buttons
            Widget getNumberKey(int? num,
                [Widget? wigetParam, bool isClearButton = false]) {
              return SizedBox(
                width: parentWidth * 0.2,
                height: parentHeight * 0.1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.white,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    foregroundColor: isTimerStarted
                        ? Colors.black.withOpacity(0.5)
                        : Colors.black,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                  ),
                  onPressed: isTimerStarted || (isPinEntered && !isClearButton)
                      ? null
                      : () =>
                          {if (isClearButton) removePin() else addPin(num!)},
                  child: wigetParam ??
                      Text(
                        num.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.01,
                        ),
                      ),
                ),
              );
            }

            return SizedBox(
              width: parentWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text widget to show the PIN entry title
                  Container(
                    margin: EdgeInsets.only(
                        left: marginSize,
                        right: marginSize,
                        bottom: parentHeight * 0.02),
                    width: parentWidth,
                    alignment: Alignment.center,
                    child: Text(
                      isRegisterOrForgotPinPage
                          ? context.appStrings.createPinLabel
                          : context.appStrings.enterPinLabel,
                      style: const TextStyle(
                        color: AppColors.enterPinLabelColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  showNoOfAttemptsLeft
                      ? Text(
                          "$noOfAttempts ${noOfAttempts == 1 ? attemptsString.substring(0, attemptsString.length - 1) : attemptsString} ${context.appStrings.left}",
                          style: const TextStyle(
                            fontSize: 16,
                          ))
                      : const Text(""),
                  // Container to show the entered PIN digits
                  Container(
                    margin: EdgeInsets.only(top: parentHeight * 0.02),
                    height: parentHeight * 0.1,
                    width: parentWidth,
                    child: isSubmiting && !(isRegisterOrForgotPinPage)
                        ? const AppLoadingIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(pinDigit, (index) {
                              // Display the PIN digit or a hint icon if empty
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: _getPinInputUI(pinInputs[index]),
                              );
                            }),
                          ),
                  ),
                  // Container with a button to submit the PIN
                  isRegisterOrForgotPinPage
                      ? Container(
                          margin: EdgeInsets.only(
                            left: marginSize,
                            right: marginSize,
                            top: parentHeight * 0.1,
                          ),
                          child: AppButton(
                            isLoading: isSubmiting,
                            onPressed: isPinEntered ? () => _submitPin() : null,
                            bgColor: AppColors.btnBgColor,
                            body: FittedBox(
                              child: Row(
                                children: [
                                  Text(
                                    isRegisterOrForgotPinPage
                                        ? context.appStrings.btnTextCreate
                                        : context.appStrings.btnTextLogin,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : const Text(""),
                  isTimerStarted
                      ? Container(
                          alignment: Alignment.center,
                          width: parentWidth,
                          margin: EdgeInsets.only(
                              left: marginSize,
                              right: marginSize,
                              bottom: parentHeight * 0.02),
                          child: Text(
                            '${context.appStrings.tryAfterLabel} : $countdownSeconds',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : const Text(""),
                  !(isRegisterOrForgotPinPage)
                      ? Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: context.appStrings.forgotPinLinkText,
                                style: TextStyle(
                                  color: AppColors.btnBgColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -1,
                                ),
                                // Gesture recognizer to handle resend OTP action
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    final mobileNumber =
                                        widget.params?["mobileNumber"];
                                    final countryDailCode =
                                        widget.params?["countryDailCode"];
                                    context.push(PagePath.enterPhoneNumber,
                                        extra: {
                                          "isForgotPinPage": true,
                                          "mobileNumber": mobileNumber,
                                          "countryDailCode": countryDailCode,
                                        });
                                  },
                              ),
                            ],
                          ),
                        )
                      : const Text(""),
                  SizedBox(height: parentHeight * 0.05),
                  // Container with the keypad for entering the PIN digits
                  SizedBox(
                    width: parentWidth,
                    height: parentHeight * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Rows of number keys 1, 2, 3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getNumberKey(1),
                            getNumberKey(2),
                            getNumberKey(3),
                          ],
                        ),
                        // Rows of number keys 4, 5, 6
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getNumberKey(4),
                            getNumberKey(5),
                            getNumberKey(6),
                          ],
                        ),
                        // Rows of number keys 7, 8, 9
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getNumberKey(7),
                            getNumberKey(8),
                            getNumberKey(9),
                          ],
                        ),
                        // Rows of number keys (empty), 0, backspace icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getNumberKey(null, const Text("")),
                            getNumberKey(0),
                            getNumberKey(
                              null,
                              const SizedBox(
                                child: Icon(
                                  size: 30,
                                  Icons.backspace_outlined,
                                  color: Colors.red,
                                ),
                              ),
                              true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  BlocListener<PinScreenCubit, PinScreenStates>(
                    listener: (context, state) {
                      state.maybeWhen(
                        loading: () => setIsSubmiting(true),
                        onVerifiedPin: ((response) {
                          final mobileNumber = widget.params?["mobileNumber"];
                          final countryDailCode =
                              widget.params?["countryDailCode"];
                          // Show success toast and save the login token
                          if (isForgotPinPage) {
                            context.push(PagePath.enterPhoneNumber, extra: {
                              "countryDailCode": countryDailCode,
                              "mobileNumber": mobileNumber,
                            });
                            return;
                          }
                          if (isRegisterPage) {
                            context.push(PagePath.firstNameLastName);
                          } else {
                            context.go(PagePath.home);
                          }
                          setIsSubmiting(false);
                        }),
                        onGetTooManyRequestsError: (error) {
                          showNoOfAttemptsLeft = false;
                          noOfAttempts = 3;
                          startTimer();
                          pinObscureTextColor = AppColors.pinHintColor;
                          _initPin();
                          setIsSubmiting(false);
                        },
                        onError: ((e) {
                          noOfAttempts--;
                          showNoOfAttemptsLeft = true;
                          pinObscureTextColor = AppColors.invalidPinColor;
                          _initPin();
                          setIsSubmiting(false);
                        }),
                        orElse: () {
                          setIsSubmiting(false);
                        },
                      );
                    },
                    child: const Text(""),
                  )
                ],
              ),
            );
          }),
        ),
        onWillPop: () async {
          // Prevent pop back
          return !isRegisterOrForgotPinPage && !isTimerStarted;
        });
  }
}
