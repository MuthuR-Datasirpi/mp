import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/widgets/app_toast.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/core/utils/common_utils.dart';
import 'package:mobile/features/auth/data/models/auth_payload_model.dart';
import 'package:mobile/features/auth/presentation/cubit/otp_screen_cubit.dart';
import 'package:mobile/features/auth/presentation/states/otp_screen_states.dart';
import 'package:mobile/features/auth/presentation/widgets/otp_text_field.dart';
import 'package:mobile/constants/common_constants.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

// Widget class for OTP Verification page
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.params});

  final Map<String, dynamic>? params;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isForgotPinPage = false;
  int otpLength = 4;
  String otpValue = "";
  int countdownSeconds = AuthConstants.OTP_TRY_AFTER_SECONDS;
  Timer? timer;
  bool isResendOtpTimerLoading = false;
  late String mobileNumber;
  late String countryDailCode;
  bool isSubmiting = false;
  int countOfEnteredInvalidOtp = 0;

  // Function to start countdown
  void startCountdown() {
    isResendOtpTimerLoading = true;
    // Create a Timer that runs every second and updates the countdown
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdownSeconds--;
      });

      if (countdownSeconds <= 0) {
        // Stop the timer when the countdown is complete
        timer.cancel();
        setState(() {
          isResendOtpTimerLoading = false;
          countdownSeconds = AuthConstants.OTP_TRY_AFTER_SECONDS;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    // Cancel the timer when the screen is disposed to avoid memory leaks
    timer?.cancel();
    super.dispose();
  }

  // Set the boolean isSubmiting
  setIsSubmiting(bool value) {
    setState(() {
      isSubmiting = value;
    });
  }

  // Funtion for show invalid otp prompt
  Future<void> _showInvalidOtpPrompt(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          title: Text(message),
          content: Text(context.appStrings.invalidOtpPromptMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.appStrings.ok),
            ),
          ],
        );
      },
    );
  }

  // Function to submit the entered OTP to the server for verification
  _submitOtp() async {
    setIsSubmiting(true);
    final VerifyOtpRequestModel payload = VerifyOtpRequestModel(
        int.parse(otpValue), "+$countryDailCode", mobileNumber);
    context.read<OtpScreenCubit>().verifyOTP(payload);
  }

  // Function on set otp
  _onSetOtp(String otp) {
    setState(() => otpValue = otp);
    if (otpValue.length == otpLength) {
      _submitOtp();
    }
  }

  // Function to resend OTP to the user's mobile number
  _reSendOtp() async {
    if (!isResendOtpTimerLoading) {
      final PostPhoneNumberRequestModel payload =
          PostPhoneNumberRequestModel("+$countryDailCode", mobileNumber);
      context.read<OtpScreenCubit>().resendOtp(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    const double marginSize = AppConstants.marginSize;
    mobileNumber = widget.params?["mobileNumber"] ?? "";
    countryDailCode = widget.params?["countryDailCode"] ?? "";
    isForgotPinPage = widget.params?["isForgotPinPage"] ?? false;

    return Scaffold(
      // App Bar with title
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double parentHeight = constraints.maxHeight;
          return Column(
            children: [
              SizedBox(height: parentHeight * 0.04),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: marginSize),
                alignment: Alignment.topLeft,
                child: Text(
                  context.appStrings.otpInputLabel,
                  style: const TextStyle(
                    color: AppColors.otpInputLabelColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: marginSize),
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: isForgotPinPage
                            ? context.appStrings.forgotPinOtpSubLabel
                            : context.appStrings.otpInputSubLabel,
                        style: const TextStyle(
                          color: AppColors.textSpanColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const TextSpan(
                        text: ' ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text:
                            "+$countryDailCode ${CommonUtils.maskStringExceptLastFour(mobileNumber)}",
                        style: const TextStyle(
                          color: AppColors.maskedNumberColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: parentHeight * 0.08),
              OTPTextField(
                isDisabled: isSubmiting,
                length: otpLength,
                onCompleted: (otp) => {_onSetOtp(otp)},
              ),
              SizedBox(height: parentHeight * 0.04),
              // Text widget to show option to resend OTP
              isResendOtpTimerLoading
                  ? Text(
                      "00:$countdownSeconds",
                      style: TextStyle(
                        color: AppColors.btnBgColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const Text(""),
              SizedBox(height: parentHeight * 0.04),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.appStrings.resendOtpLabel,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: context.appStrings.resendOtpLinkText,
                      style: TextStyle(
                        color: isResendOtpTimerLoading
                            ? AppColors.dropdownIconColor
                            : AppColors.hyperLinkColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      // Gesture recognizer to handle resend OTP action
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _reSendOtp();
                        },
                    ),
                  ],
                ),
              ),
              BlocListener<OtpScreenCubit, OtpScreenStates>(
                listener: (context, state) {
                  state.maybeWhen(
                    loading: () => setIsSubmiting(true),
                    onVerifiedOtp: ((response) {
                      setIsSubmiting(false);
                      // Navigate to the PIN creation page if the OTP is verified
                      context.push(PagePath.pinPage, extra: {
                        "countryDailCode": countryDailCode,
                        "mobileNumber": mobileNumber,
                        isForgotPinPage ? 'isForgotPinPage' : 'isRegisterPage':
                            true
                      });
                    }),
                    onSuccessResendOtp: (response) {
                      startCountdown();
                      // Show success message on OTP resend
                      AppToast.toastSuccess(response?.message);
                    },
                    onGetTooManyRequestsError: (error) {
                      setIsSubmiting(false);
                      // Invalid OTP Twice
                      if (!isForgotPinPage) {
                        countOfEnteredInvalidOtp++;
                        if (countOfEnteredInvalidOtp > 1) {
                          // Prompt for suggest google SSO
                          _showInvalidOtpPrompt(error);
                          return;
                        }
                      }
                      AppToast.toastError(error);
                    },
                    onError: ((error) {
                      AppToast.toastError(error);
                    }),
                    orElse: () {
                      setIsSubmiting(false);
                    },
                  );
                },
                child: const Text(""),
              )
            ],
          );
        },
      ),
    );
  }
}
