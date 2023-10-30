import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:mobile/common/widgets/app_button.dart';
import 'package:mobile/common/widgets/app_input.dart';
import 'package:mobile/constants/common_constants.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';
import 'package:intl_phone_field/countries.dart' as contriesConst;

class Signupinfo extends StatefulWidget {
  const Signupinfo({super.key});

  @override
  State<Signupinfo> createState() => _SignupState();
}

class _SignupState extends State<Signupinfo> with WidgetsBindingObserver {
  bool isFocusedPhoneInput = false;
  final FocusNode _phoneInputFocusNode = FocusNode();
  late String countryDailCode;
  late String countryCode;
  late List<Country> countries;
  late int phoneNumberMaxLength;
  String mobileNumber = "";
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

  // Returns boolean is valid phone number length
  get isValidPhoneNumberLength =>
      mobileNumber.isNotEmpty && phoneNumberMaxLength == mobileNumber.length;

  // Returns boolean - to check input isNumeric
  get isNumeric {
    final numericRegExp = RegExp(ValidationConstants.REGEX_IS_NUMERIC);
    return numericRegExp.hasMatch(mobileNumber);
  }

  resetMobileNumber(String number) {
    mobileNumber = number;
    _phoneNumberInputController.text = number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackgroundColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double parentHeight = constraints.maxHeight;
          return Container(
            padding: const EdgeInsets.all(20),
            height: parentHeight,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.appStrings.almostthere,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        SizedBox(
                          height: parentHeight * 0.02,
                        ),
                        Text(
                          context.appStrings.signupinfosubtitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xff2E2E2E)),
                        ),
                        SizedBox(
                          height: parentHeight * 0.03,
                        ),
                        AppInput(
                          label: context.appStrings.firstNameLabel,
                          onChanged: (p0) {},
                        ),
                        SizedBox(
                          height: parentHeight * 0.02,
                        ),
                        AppInput(
                          label: context.appStrings.lastNameLabel,
                          onChanged: (p0) {},
                        ),
                        SizedBox(
                          height: parentHeight * 0.02,
                        ),
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
                              margin: const EdgeInsets.only(top: 10, right: 5),
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      "+$countryDailCode",
                                      style: const TextStyle(
                                        color: AppColors.dropdownIconColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down_sharp,
                                      color: AppColors.dropdownIconColor),
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
                                              color:
                                                  AppColors.dropdownIconColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Text(
                                            country.name,
                                            style: const TextStyle(
                                              color: AppColors.countryNameColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        countryDailCode = country.dialCode;
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
                        SizedBox(
                          height: parentHeight * 0.02,
                        ),
                        AppInput(
                          label: context.appStrings.email,
                          onChanged: (p0) {},
                        ),
                        SizedBox(
                          height: parentHeight * 0.02,
                        ),
                        Text(
                          context.appStrings.signupinfobottomtitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Color(0xff666666)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: parentHeight * 0.02),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: context.appStrings.privacyPolicy,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff8A8A8A)),
                              children: [
                                TextSpan(
                                  text: context.appStrings.andSign,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color(0xff8A8A8A)),
                                ),
                                TextSpan(
                                  text: context.appStrings.termsConditions,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff8A8A8A),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff8A8A8A),
                                  ),
                                  // Gesture recognizer to click Terms and condition
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // print("object");
                                    },
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: parentHeight * 0.025,
                        ),
                        AppButton(
                            onPressed: () {},
                            bgColor: AppColors.btnBgColor,
                            body: FittedBox(
                              child: Text(
                                context.appStrings.register,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ]),
          );
        },
      ),
    );
  }
}
