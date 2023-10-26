import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/custom_appbar.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class Summary extends StatefulWidget {
  Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  bool isChecked = false;

  _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.padding_20,
                  horizontal: Dimensions.padding_20),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    child: Text(
                      "1",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.backgroundWhiteColor),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    context.appStrings.summary,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 48,
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColors.pinHintColor,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    child: Text(
                      "2",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.subTitleBlackColor),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.lightGreyBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    context.appStrings.payment,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              height: 1.5,
              color: AppColors.dividerGreyColor,
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.padding_20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.padding_20),
                    child: Text(
                      context.appStrings.orderSummary,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlack),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.padding_20),
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                              width: 1, color: AppColors.blackBorder)),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset("assets/images/ke2.png")),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                left: Dimensions.padding_10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Weight loss Meal Plan",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryBlack),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Keto by Foxxy",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.inputLabelColor),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Breakfast + Lunch + Dinner + 2 Snacks",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.inputLabelColor),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "5 days • 1 week • 1800 - 2500 cal",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.inputLabelColor),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.padding_20),
                    child: Container(
                      height: 1,
                      color: AppColors.deviderColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.padding_20),
                    child: Text(
                      context.appStrings.deliverAddress,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlack),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.padding_20),
                    child: DottedBorder(
                      dashPattern: [8, 8],
                      strokeWidth: 1,
                      color: AppColors.blackGrayColor,
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              context.appStrings.addNewAddress,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.padding_20),
                    child: Container(
                      height: 1,
                      color: AppColors.deviderColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.padding_20),
                    child: Text(
                      context.appStrings.deliveryTime,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlack),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.padding_20),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 108,
                          height: 51,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  width: 1, color: AppColors.blackBorder)),
                          child: Text(
                            "9 am - 11 am",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryBlack),
                          ),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 108,
                          height: 51,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  width: 1, color: AppColors.blackBorder)),
                          child: Text(
                            "9 am - 11 am",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackGrayColor),
                          ),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 108,
                          height: 51,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                  width: 1, color: AppColors.blackBorder)),
                          child: Text(
                            "9 am - 11 am",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackGrayColor),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1,
                  offset: Offset(-1, -1), // Shadow position
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          color: AppColors.blackBorder,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          checkColor: AppColors.backgroundWhiteColor,
                          activeColor: AppColors.primaryColor,
                          focusColor: AppColors.primaryColor,
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (!states.contains(MaterialState.selected)) {
                              return AppColors.blackBorder;
                            }
                            return null;
                          }),
                          // side: BorderSide(width: 0.0, strokeAlign: 0),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: context.appStrings.iAgreeToThe,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.textGreyColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: context.appStrings.privacyPolicy,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: ' & ',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.textGreyColor),
                          ),
                          TextSpan(
                            text: context.appStrings.termsConditions,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    context.push(PagePath.payment);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: Dimensions.padding_15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.blackGrayColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Text(
                      "PAY AED  1,116.00",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: context.appStrings.summary),
            Expanded(child: _body())
          ],
        ),
      ),
    );
  }
}
