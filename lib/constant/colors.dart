import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xff308DE3);
  static const info = Color(0xff00cfe8);
  static const neutral = Color(0xff333333);
  static const white = Colors.white;
  static const grey900 = Color(0xff2E2E2E);
  static const grey800 = Color(0xff4D4D4D);
  static const grey700 = Color(0xff646464);
  static const grey600 = Color(0xff808080);
  static const grey400 = Color(0xffCCCCCC);
  static const grey300 = Color(0xffD8D8D8);
  static const grey200 = Color(0xffF3F3F3);
  static const grey100 = Color(0xffF7F7F7);
  static const grey50 = Color(0xffFCFCFC);

  static const redText = Color(0xffD64747);
  static const failD93A3A = Color(0xffD93A3A);
  static const redFFF4F4 = Color(0xffFFF4F4);
  static const redBg = Color(0xffFFE2E2);

  static const greenText = Color(0xff25B233);
  static const greenF4FFF7 = Color(0xffF4FFF7);
  static const greenBg = Color(0xffEAF8E3);

  static const blue50 = Color(0xffF5FAFF);
  static const blue100 = Color(0xffE5F1FD);

  static const yellowText = Color(0xffCA9612);
  static const warning = Color(0xffEAA601);
  static const yellowBg = Color(0xffFFF9E3);
  static const yellowF4B500 = Color(0xffF4B500);
}

extension ColorExtension on TextStyle {
  // Color
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get neutral => copyWith(color: AppColors.neutral);

  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get transparent => copyWith(color: Colors.transparent);
  TextStyle get grey900 => copyWith(color: AppColors.grey900);
  TextStyle get grey800 => copyWith(color: AppColors.grey800);
  TextStyle get grey700 => copyWith(color: AppColors.grey700);
  TextStyle get grey600 => copyWith(color: AppColors.grey600);
  TextStyle get grey400 => copyWith(color: AppColors.grey400);
  TextStyle get grey300 => copyWith(color: AppColors.grey300);
  TextStyle get grey200 => copyWith(color: AppColors.grey200);
  TextStyle get grey100 => copyWith(color: AppColors.grey100);
  TextStyle get grey50 => copyWith(color: AppColors.grey50);
  TextStyle get redText => copyWith(color: AppColors.redText);
  TextStyle get failD93A3A => copyWith(color: AppColors.failD93A3A);
  TextStyle get greenText => copyWith(color: AppColors.greenText);
  TextStyle get blue50 => copyWith(color: AppColors.blue50);
  TextStyle get yellowText => copyWith(color: AppColors.yellowText);
  TextStyle get warning => copyWith(color: AppColors.warning);
  TextStyle get yellowBg => copyWith(color: AppColors.yellowBg);

  TextStyle get s12 => copyWith(fontSize: 12.h);
  TextStyle get s14 => copyWith(fontSize: 14.h);

  // Decoration
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  // fontWeight
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  // letterSpacing
  TextStyle get addSpacing => copyWith(letterSpacing: -0.05);
}
