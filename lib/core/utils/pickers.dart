import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class PickersUtil {
  PickersUtil._();

  ///***
  ///
  ///Show adaptive native date picker dialog on Android & iOS
  static Future<void> showDatePickerDialog(BuildContext context,
      {required DateTime firstDate,
      required DateTime initialDate,
      required DateTime lastDate,
      required void Function(DateTime) onDatePick,
      String title = 'Select a date',
      bool isAdaptive = true}) async {
    if (Platform.isIOS && isAdaptive) {
      await showCupertinoDatePickerDialog(context,
          firstDate: firstDate,
          initialDate: initialDate,
          lastDate: lastDate,
          title: title, onDatePick: (dateTime) {
        onDatePick.call(dateTime);
      });
    } else {
      final result = await showDatePicker(
          context: context,
          helpText: title,
          firstDate: firstDate,
          initialDate: initialDate,
          lastDate: lastDate);
      if (result != null) {
        onDatePick.call(result);
      }
    }
  }

  static Future<void> showCupertinoDatePickerDialog(
    BuildContext context, {
    required DateTime firstDate,
    required DateTime initialDate,
    required DateTime lastDate,
    required String title,
    required void Function(DateTime) onDatePick,
  }) async {
    DateTime? pickedDate;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          titlePadding: const EdgeInsets.all(Dimensions.materialPadding),
          insetPadding: const EdgeInsets.all(32),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: context.deviceWidth,
            height: 200,
            child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                backgroundColor: Colors.white,
                initialDateTime: initialDate,
                minimumDate: firstDate,
                maximumDate: lastDate,
                onDateTimeChanged: (result) {
                  pickedDate = result;
                }),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(context.appStrings.cancelBtnText),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onDatePick.call(pickedDate ?? initialDate);
              },
              child: Text(context.appStrings.ok_btn_text),
            ),
          ],
        );
      },
    );
  }

  static Future<DateTimeRange?> showDateRangePickerDialog(
      BuildContext context, DateTimeRange dateTimeRange) async {
    DateTimeRange? dateRange = await showDateRangePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      saveText: '',
      helpText: '',
      locale: const Locale('en'),
      context: context,
      initialDateRange: dateTimeRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.textColorBlack,
              onSurface: AppColors.textGreyColor,
            ),
          ),
          child: child!,
        );
      },
    );
    return dateRange;
  }
}
