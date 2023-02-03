import 'package:flutter/material.dart';
import 'package:stock_scan_parser/styles/colors/app_color_helper.dart';

class DecorationHelper {
  static InputDecoration defaultScreenTextFieldDecor = const InputDecoration(
    contentPadding: EdgeInsets.all(8),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColorHelper.black,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColorHelper.black,
        width: 1,
      ),
    ),
  );
}
