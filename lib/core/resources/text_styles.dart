import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/resources/colors.dart';

abstract class AppStyles {
  static TextStyle badgeStyle = GoogleFonts.poppins(
    height: 1.2,
    color: AppColors.textColorBlack,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

//heading styles
  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );
  static TextStyle heading6 = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle heading4 = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle heading5 = GoogleFonts.poppins(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );

//medium styles
  static TextStyle medium14 = GoogleFonts.poppins(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium12 = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );

//regular styles
  static TextStyle regular12 = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}
