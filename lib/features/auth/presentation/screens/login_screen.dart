import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:mobile/common/widgets/app_input.dart';
import 'package:mobile/common/widgets/app_logo.dart';
import 'package:mobile/common/widgets/app_toast.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/drawables.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/features/auth/data/models/auth_payload_model.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/presentation/cubit/login_screen_cubit.dart';
import 'package:mobile/features/auth/presentation/states/login_screen_states.dart';
import 'package:mobile/common/widgets/app_button.dart';
import 'package:mobile/constants/common_constants.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';
import 'package:intl_phone_field/countries.dart' as contriesConst;

// Widget class for Login or Signup page
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.params});

  final Map<String, dynamic>? params;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  bool isForgotPinPage = false;
  bool isProgressing = false;
  bool isSigningGoogle = false;
  bool isKeypadOpened = false;
  bool isLoginPage = false;

  late String countryDailCode;
  late String countryCode;
  late int phoneNumberMaxLength;
  late List<Country> countries;
  String mobileNumber = "";
  bool isFetchedFromRouteParams = false;

  final FocusNode _phoneInputFocusNode = FocusNode();
  bool isFocusedPhoneInput = false;

  final TextEditingController _phoneNumberInputController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    // filter the countries by required country codes
    countries = contriesConst.countries
        .where((country) =>
            AppConstants.COUNTRIES_FOR_DAILCODE.contains(country.code))
        .toList();
    // Init the country code as SA
    countryCode = countries[0].code;
    countryDailCode = countries[0].dialCode;
    phoneNumberMaxLength = countries[0].maxLength;

    // Adding observer for listening the keypad open
    WidgetsBinding.instance.addObserver(this);

    // Input focus node listener
    _phoneInputFocusNode.addListener(() {
      if (_phoneInputFocusNode.hasFocus) {
        setState(() {
          isFocusedPhoneInput = true;
        });
      } else {
        // Text field has lost focus
        setState(() {
          isFocusedPhoneInput = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // Removing observer for listening the keypad open
    WidgetsBinding.instance.removeObserver(this);
    // Input focus node dispose
    _phoneInputFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // Set the boolean when keypad has been opened
    super.didChangeMetrics();
    final keyboardIsOpen = View.of(context).viewInsets.bottom > 0;
    setState(() {
      isKeypadOpened = keyboardIsOpen;
    });
  }

  // Returns boolean is valid phone number length
  get isValidPhoneNumberLength =>
      mobileNumber.isNotEmpty && phoneNumberMaxLength == mobileNumber.length;

  // Returns boolean - to check input isNumeric
  get isNumeric {
    final numericRegExp = RegExp(ValidationConstants.REGEX_IS_NUMERIC);
    return numericRegExp.hasMatch(mobileNumber);
  }

  // return boolean - is valid phone number
  get isValidPhoneNumber => isValidPhoneNumberLength && isNumeric;

  // Set mobile number
  resetMobileNumber(String number) {
    mobileNumber = number;
    _phoneNumberInputController.text = number;
  }

  // Function get validation message
  getValidationMessage() {
    if (!isValidPhoneNumberLength) {
      return context.appStrings.phoneNumberMinLengthErrorMsg;
    }
    if (!isNumeric) {
      return context.appStrings.phoneNumberInvalidErrorMsg;
    }

    return context.appStrings.phoneNumberInvalidErrorMsg;
  }

  // Returns boolean is Login Or is Forgot pin page
  get isLoginOrForgotPinPage => isLoginPage || isForgotPinPage;

  // Set the boolean isProgressing
  setIsProgressing(bool value) {
    setState(() {
      isProgressing = value;
    });
  }

  // Function to handle the login process
  _continueSignup() async {
    setIsProgressing(true);
    if (!isValidPhoneNumberLength) {
      setIsProgressing(false);
      AppToast.toastError(context.appStrings.phoneNumberEmptyErrorMsg);
      return;
    }

    final PostPhoneNumberRequestModel payload =
        PostPhoneNumberRequestModel("+$countryDailCode", mobileNumber);
    if (isForgotPinPage) {
      context.read<LoginScreenCubit>().onProceedForgotPin(payload);
    } else {
      context.read<LoginScreenCubit>().onProceedWithPhoneNumber(payload);
    }
  }

  // Function for on click google
  onClickSigninByGoogle() async {
    setState(() {
      isSigningGoogle = true;
    });
    context.read<LoginScreenCubit>().googleLogin();
  }

  @override
  Widget build(BuildContext context) {
    isForgotPinPage = widget.params?["isForgotPinPage"] ?? false;
    if (!isFetchedFromRouteParams) {
      if (widget.params?["mobileNumber"] != null &&
          widget.params?["countryDailCode"] != null) {
        mobileNumber = widget.params?["mobileNumber"] ?? "";
        countryDailCode = widget.params?["countryDailCode"] ?? "";
        countryCode = countryDailCode;
      }
      isFetchedFromRouteParams = true;
    }

    const double marginSize = AppConstants.marginSize;
    return Scaffold(
      appBar: isLoginOrForgotPinPage
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (isLoginPage) {
                    setState(() {
                      isLoginPage = false;
                    });
                  } else {
                    Navigator.of(context).pop(); //
                  }
                },
              ),
            )
          : null,
      // Body
      body: LayoutBuilder(
        builder: (context, constraints) {
          double parentHeight = constraints.maxHeight;
          double parentWidth = constraints.maxWidth;
          // Parent container
          return Container(
            height: parentHeight,
            decoration: BoxDecoration(
                color: isLoginOrForgotPinPage
                    ? Colors.white
                    : AppColors.backgroundColor),
            // Stack widget
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Sizedbox - Children1 - holds logo and banner image
                !(isLoginOrForgotPinPage)
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: parentHeight * 0.05),
                              width: parentWidth * 0.4,
                              child: const AppLogo(),
                            ),
                            // Container for the login/signup banner
                            Container(
                              margin: EdgeInsets.only(top: parentHeight * 0.01),
                              width: double.infinity,
                              height: isKeypadOpened
                                  ? parentHeight * 0.65
                                  : parentHeight * 0.6,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Drawables.loginBanner),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                // Positioned - Children2 - holds Signup/Login inputs and buttons
                Positioned(
                  bottom: isLoginOrForgotPinPage ? null : 0,
                  left: isLoginOrForgotPinPage ? null : 0,
                  right: isLoginOrForgotPinPage ? null : 0,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text widget to show the login/signup title
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: marginSize),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: !(isLoginOrForgotPinPage)
                                ? const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  )
                                : const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                            shadows: !(isLoginOrForgotPinPage)
                                ? const [
                                    BoxShadow(
                                      color: AppColors.boxShadowColor,
                                      blurRadius: 15,
                                      offset: Offset(1, 0),
                                      spreadRadius: 0,
                                    )
                                  ]
                                : [],
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isLoginOrForgotPinPage
                                    ? Text(
                                        isForgotPinPage
                                            ? context
                                                .appStrings.forgotPinPageTitle
                                            : context.appStrings.loginPageTitle,
                                        style: const TextStyle(
                                          color: AppColors.otpInputLabelColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : const Text(""),
                                isForgotPinPage
                                    ? Container(
                                        margin: EdgeInsets.only(
                                          bottom: parentHeight * 0.02,
                                        ),
                                        width: parentWidth,
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          context.appStrings
                                              .enterMobileNumberLabelForForgotPin,
                                          style: const TextStyle(
                                            color: AppColors.inputLabelColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : const Text(""),
                                // Container with TextField for phone number input
                                AppInput(
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  controller: _phoneNumberInputController,
                                  label: context.appStrings.mobileNumberLabel,
                                  maxLength: phoneNumberMaxLength,
                                  prefix: PopupMenuButton<Country>(
                                    color: Colors.white,
                                    offset: const Offset(-16, 50),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, right: 5),
                                      width: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: Text(
                                              "+$countryDailCode",
                                              style: const TextStyle(
                                                color:
                                                    AppColors.dropdownIconColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color:
                                                  AppColors.dropdownIconColor),
                                        ],
                                      ),
                                    ),
                                    itemBuilder: (context) {
                                      return countries.map((country) {
                                        return PopupMenuItem(
                                            padding: EdgeInsets.zero,
                                            value: country,
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: const BoxDecoration(
                                                color: AppColors.greenShade,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "+${country.dialCode}",
                                                    style: const TextStyle(
                                                      color: AppColors
                                                          .dropdownIconColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Text(
                                                    country.name,
                                                    style: const TextStyle(
                                                      color: AppColors
                                                          .countryNameColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                countryDailCode =
                                                    country.dialCode;
                                                phoneNumberMaxLength =
                                                    country.maxLength;
                                              });
                                            });
                                      }).toList();
                                    },
                                  ),
                                  onChanged: (phNo) =>
                                      {setState(() => mobileNumber = phNo)},
                                ),
                                // Validation message
                                mobileNumber.isNotEmpty && !isValidPhoneNumber
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 6),
                                        child: Text(
                                          getValidationMessage(),
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ),
                                      )
                                    : const Text(""),
                                mobileNumber.isNotEmpty && !isValidPhoneNumber
                                    ? SizedBox(height: parentHeight * 0.01)
                                    : SizedBox(height: parentHeight * 0.02),
                                // Container with a button to continue the login process
                                AppButton(
                                    isLoading: isProgressing,
                                    onPressed: isValidPhoneNumber
                                        ? _continueSignup
                                        : null,
                                    bgColor: AppColors.btnBgColor,
                                    body: FittedBox(
                                      child: Text(
                                        context.appStrings.btnTextContinue,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: parentHeight * 0.02,
                                ),
                                // Container with a button to continue with Google
                                !isForgotPinPage && !isKeypadOpened ||
                                        isLoginPage
                                    ? AppButton(
                                        isLoading: isSigningGoogle,
                                        disabledBgColor: Colors.white,
                                        onPressed: () =>
                                            {onClickSigninByGoogle()},
                                        bgColor: Colors.white,
                                        body: FittedBox(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/google.png'),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                context.appStrings
                                                    .btnTextGoogleLogin,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : const Text(""),
                                !isLoginOrForgotPinPage && !isKeypadOpened
                                    ? Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            top: parentHeight * 0.02),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${context.appStrings.alreadyHaveAnAccount}, ',
                                                style: const TextStyle(
                                                  color: AppColors
                                                      .hyperLinkLabelColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextSpan(
                                                text: context
                                                    .appStrings.btnTextLogin,
                                                style: TextStyle(
                                                  color:
                                                      AppColors.hyperLinkColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        resetMobileNumber("");
                                                        setState(() {
                                                          isLoginPage = true;
                                                        });
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: parentHeight * 0.04,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocListener<LoginScreenCubit, LoginScreenStates>(
                  listener: (context, state) {
                    state.maybeWhen(
                      loading: () => setIsProgressing(true),
                      onPhoneNumberValidated: ((response) {
                        final params = {
                          "countryDailCode": countryDailCode,
                          "mobileNumber": mobileNumber,
                        };

                        final User? responsePayload = response.payload;
                        final isNewUser = responsePayload?.newUser == true;
                        final isMobileNumberVerified =
                            responsePayload?.mobileNumberVerified == true;
                        final isPinSet = responsePayload?.pinSet == true;

                        // Check if the user is new or mobile number verification is pending
                        if (isNewUser || !isMobileNumberVerified) {
                          // Navigate to the OTP verification page if needed
                          context.push(PagePath.otpPage, extra: params);
                        } else {
                          // Check if PIN is already set or not
                          if (isPinSet) {
                            // Navigate to the PIN entry page if PIN is set
                            context.push(PagePath.pinPage, extra: params);
                          } else {
                            // Navigate to the PIN creation page if PIN is not set
                            context.push(PagePath.otpPage,
                                extra: {...params, "isRegisterPage": true});
                          }
                        }
                        setIsProgressing(false);
                      }),
                      onSuccessForgotPin: (() {
                        final params = {
                          "countryDailCode": countryDailCode,
                          "mobileNumber": mobileNumber,
                        };
                        context.push(PagePath.otpPage,
                            extra: {...params, "isForgotPinPage": true});
                        setIsProgressing(false);
                      }),
                      onSuccessGoogleSignIn: (response) {
                        setState(() {
                          isSigningGoogle = false;
                        });
                        context.go(PagePath.home);
                      },
                      onError: ((error) {
                        setIsProgressing(false);
                        setState(() {
                          isSigningGoogle = false;
                        });
                      }),
                      orElse: () {
                        setIsProgressing(false);
                        setState(() {
                          isSigningGoogle = false;
                        });
                      },
                    );
                  },
                  child: const SizedBox.shrink(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
