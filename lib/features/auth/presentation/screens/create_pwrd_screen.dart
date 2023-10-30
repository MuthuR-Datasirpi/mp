import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/app_button.dart';
import 'package:mobile/common/widgets/app_input.dart';
import 'package:mobile/core/resources/resources.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool ishidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundWhiteColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double parentHeight = constraints.maxHeight;
          return Container(
            height: parentHeight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: parentHeight * 0.04,
                      ),
                      Text(
                        context.appStrings.enterpwrd,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      SizedBox(
                        height: parentHeight * 0.02,
                      ),
                      Text(
                        context.appStrings.enterpwrdsubtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.subTitleBlackColor,
                        ),
                      ),
                      SizedBox(
                        height: parentHeight * 0.03,
                      ),
                      AppInput(
                        obscuretext: ishidden,
                        obscuringCharacter: '*',
                        suffixicon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            ishidden ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.btnDisableColor,
                          ),
                        ),
                        label: context.appStrings.password,
                        onChanged: (p0) {},
                      ),
                      SizedBox(
                        height: parentHeight * 0.03,
                      ),
                      GestureDetector(
                          onTap: () {
                            print("object");
                          },
                          child: Text(
                            context.appStrings.forgetyourpassword,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: AppColors.primaryColor),
                          ))
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: parentHeight * 0.06),
                    child: AppButton(
                        onPressed: () {},
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
                        )))
              ],
            ),
          );
        },
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      ishidden = !ishidden;
    });
  }
}
