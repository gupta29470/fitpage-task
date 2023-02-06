import 'package:flutter/material.dart';
import 'package:stock_scan_parser/common/helpers/navigation_helper.dart';
import 'package:stock_scan_parser/common/helpers/route_helper.dart';
import 'package:stock_scan_parser/stock_parser/models/criteria_screen_args.dart';
import 'package:stock_scan_parser/stock_parser/models/stock_scan_parser_model.dart';
import 'package:stock_scan_parser/stock_parser/widgets/stock_scan_header_widget.dart';
import 'package:stock_scan_parser/styles/colors/app_color_helper.dart';
import 'package:stock_scan_parser/styles/themes/text_theme_helper.dart';

part '../stock_parser_extension/stock_scan_parser_widget_ext.dart';

class StockScanParserWidget extends StatefulWidget {
  final List<StockScanParserModel?> stockScanParserModelList;

  const StockScanParserWidget({
    super.key,
    required this.stockScanParserModelList,
  });

  @override
  State<StockScanParserWidget> createState() => _StockScanParserWidgetState();
}

class _StockScanParserWidgetState extends State<StockScanParserWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.stockScanParserModelList.length,
      itemBuilder: (_, index) {
        StockScanParserModel? model = widget.stockScanParserModelList[index];

        if (model != null) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  navigateToCriteriaScreen(model);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    0,
                    16,
                    8,
                  ),
                  child: StockScanHeaderWidget(
                    name: model.name,
                    tag: model.tag,
                  ),
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
          "Data Not Available",
          style: TextThemeHelper.white_16_600,
        );
      },
    );
  }
}
