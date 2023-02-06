import 'package:flutter/material.dart';
import 'package:stock_scan_parser/common/helpers/navigation_helper.dart';
import 'package:stock_scan_parser/stock_parser/models/values_screen_args.dart';
import 'package:stock_scan_parser/styles/colors/app_color_helper.dart';
import 'package:stock_scan_parser/styles/themes/text_theme_helper.dart';

class ValuesScreen extends StatelessWidget {
  static const String tag = "ValuesScreen";

  final ValuesScreenArgs valuesScreenArgs;

  const ValuesScreen({
    super.key,
    required this.valuesScreenArgs,
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
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        itemCount: valuesScreenArgs.values.length,
        itemBuilder: (_, index) {
          int? value = valuesScreenArgs.values[index];

          if (value != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "$value",
                    style: TextThemeHelper.white_16_600,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: AppColorHelper.white,
                ),
              ],
            );
          }
          return Text(
            "No Values Here",
            style: TextThemeHelper.white_16_600,
          );
        },
      ),
    );
  }
}
