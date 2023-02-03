import 'package:flutter/material.dart';
import 'package:stock_scan_parser/common/helpers/app_helper.dart';
import 'package:stock_scan_parser/styles/themes/text_theme_helper.dart';

part '../stock_parser_extension/stock_scan_header_widget_ext.dart';

class StockScanHeaderWidget extends StatelessWidget {
  final String? tag;
  final String? name;

  const StockScanHeaderWidget({
    super.key,
    required this.name,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (AppHelper.isNotEmpty(name)) ...[
          Text(
            name ?? "",
            style: TextThemeHelper.white_16_600_underline,
          ),
        ],
        if (AppHelper.isNotEmpty(tag)) ...[
          Text(
            tag ?? "",
            style: isTagBullish(tag ?? "")
                ? TextThemeHelper.felwoodLeaves_10_400_underline
                : TextThemeHelper.sparklingRed_10_400_underline,
          ),
        ]
      ],
    );
  }
}
