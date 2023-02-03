import 'package:flutter/material.dart';
import 'package:stock_scan_parser/common/helpers/app_helper.dart';
import 'package:stock_scan_parser/common/helpers/navigation_helper.dart';
import 'package:stock_scan_parser/stock_parser/models/default_values_screen_args.dart';
import 'package:stock_scan_parser/styles/colors/app_color_helper.dart';
import 'package:stock_scan_parser/styles/themes/decoration_helper.dart';
import 'package:stock_scan_parser/styles/themes/text_theme_helper.dart';

class DefaultValueScreen extends StatelessWidget {
  static const String tag = "DefaultValueScreen";

  final DefaultValueScreenArgs defaultValueScreenArgs;

  const DefaultValueScreen({
    super.key,
    required this.defaultValueScreenArgs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.kuretakeBlackManga,
      appBar: AppBar(
        backgroundColor: AppColorHelper.kuretakeBlackManga,
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: IconButton(
            onPressed: () {
              NavigationHelper.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColorHelper.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (AppHelper.isNotEmpty(defaultValueScreenArgs.heading)) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "${defaultValueScreenArgs.heading}",
                  style: TextThemeHelper.white_16_600,
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "Set Parameters",
                style: TextThemeHelper.white_16_400,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20).copyWith(bottom: 56),
              color: AppColorHelper.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Period",
                    style: TextThemeHelper.black_16_400,
                  ),
                  if (defaultValueScreenArgs.defaultValue != null) ...[
                    SizedBox(
                      height: 32,
                      width: 200,
                      child: TextField(
                        controller: TextEditingController(
                          text: "${defaultValueScreenArgs.defaultValue}",
                        ),
                        decoration:
                            DecorationHelper.defaultScreenTextFieldDecor,
                      ),
                    )
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
