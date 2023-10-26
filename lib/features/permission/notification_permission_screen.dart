import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/widgets/app_button.dart';
import 'package:mobile/core/di/injector.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/drawables.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/data/sources/local/preferences/app_preferences.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationPermissionScreen extends StatefulWidget {
  const NotificationPermissionScreen({Key? key}) : super(key: key);

  @override
  State<NotificationPermissionScreen> createState() =>
      NotificationPermissionScreenState();
}

class NotificationPermissionScreenState
    extends State<NotificationPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhiteColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double parentHeight = constraints.maxHeight;
          return Container(
            height: parentHeight,
            padding: const EdgeInsets.symmetric(horizontal: 31),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: parentHeight * 0.15),
                        padding: const EdgeInsets.all(20),
                        child: Image.network(
                          Drawables.notificationPermissionBanner,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: parentHeight * 0.02),
                        child: Text(
                          context.appStrings.notificationPermissionTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        context.appStrings.notificationPermissionSubTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.inputLabelColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: parentHeight * 0.05),
                  child: Column(
                    children: [
                      AppButton(
                        bgColor: AppColors.btnBgColor,
                        body: FittedBox(
                          child: Text(
                            context.appStrings.turnOnNotification,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        onPressed: () => requestNotificationPermission(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          onRedirect();
                        },
                        child: Text(
                          context.appStrings.maybe,
                          style: const TextStyle(
                            color: Color(0xFF2D2D2D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  onRedirect() {
    final appPreferences = Injector.resolve<AppPreferences>();
    String? token = appPreferences.getUserAccessToken();
    if (token == null) {
      context.go(PagePath.enterPhoneNumber);
    } else {
      context.go(PagePath.home);
    }
  }

  Future<void> requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      onRedirect();
    }
  }
}
