import 'package:flutter/material.dart';
import 'package:stock_scan_parser/styles/colors/app_color_helper.dart';

class TextThemeHelper {
  static TextStyle white_12_400 = const TextStyle(
    color: AppColorHelper.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle white_16_600_underline = const TextStyle(
    color: AppColorHelper.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );

  static TextStyle felwoodLeaves_10_400_underline = const TextStyle(
    color: AppColorHelper.felwoodLeaves,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static TextStyle sparklingRed_10_400_underline = const TextStyle(
    color: AppColorHelper.sparklingRed,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static TextStyle white_16_600 = const TextStyle(
    color: AppColorHelper.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle blue_16_600_underline = const TextStyle(
    color: AppColorHelper.blue,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );

  static TextStyle white_16_400 = const TextStyle(
    color: AppColorHelper.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black_16_400 = const TextStyle(
    color: AppColorHelper.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
