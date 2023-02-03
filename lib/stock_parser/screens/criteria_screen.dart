import 'package:flutter/material.dart';
import 'package:stock_scan_parser/common/helpers/app_helper.dart';
import 'package:stock_scan_parser/common/helpers/navigation_helper.dart';
import 'package:stock_scan_parser/common/helpers/route_helper.dart';
import 'package:stock_scan_parser/stock_parser/models/criteria_screen_args.dart';
import 'package:stock_scan_parser/stock_parser/models/default_values_screen_args.dart';
import 'package:stock_scan_parser/stock_parser/models/stock_scan_parser_model.dart';
import 'package:stock_scan_parser/stock_parser/models/values_screen_args.dart';
import 'package:stock_scan_parser/stock_parser/widgets/stock_scan_header_widget.dart';
import 'package:stock_scan_parser/styles/colors/app_color_helper.dart';
import 'package:stock_scan_parser/styles/themes/text_theme_helper.dart';

part '../stock_parser_extension/criteria_screen_ext.dart';

class CriteriaScreen extends StatefulWidget {
  static const String tag = "CriteriaScreen";

  final CriteriaScreenArgs criteriaScreenArgs;

  const CriteriaScreen({
    super.key,
    required this.criteriaScreenArgs,
  });

  @override
  State<CriteriaScreen> createState() => _CriteriaScreenState();
}

class _CriteriaScreenState extends State<CriteriaScreen> {
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: AppColorHelper.mediterraneanSea,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.fromLTRB(
                12,
                12,
                12,
                52,
              ),
              child: StockScanHeaderWidget(
                tag: widget.criteriaScreenArgs.tag,
                name: widget.criteriaScreenArgs.name,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.criteriaScreenArgs.criteriaList.length,
                itemBuilder: (_, index1) {
                  CriteriaModel criteriaModel =
                      widget.criteriaScreenArgs.criteriaList[index1];

                  if (AppHelper.isNotEmpty(criteriaModel.type) &&
                      criteriaModel.text != null &&
                      criteriaModel.text?.isNotEmpty == true) {
                    // plain type building
                    if (isPlainText(criteriaModel.type)) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int index2 = 0;
                              index2 < (criteriaModel.text?.length ?? 0);
                              index2++) ...[
                            if (AppHelper.isNotEmpty(
                                criteriaModel.text?[index2])) ...[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Text(
                                  "${criteriaModel.text?[index2]}",
                                  style: TextThemeHelper.white_16_600,
                                ),
                              ),
                              if (index1 <
                                  (widget.criteriaScreenArgs.criteriaList
                                          .length -
                                      1)) ...[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    "and",
                                    style: TextThemeHelper.white_12_400,
                                  ),
                                ),
                              ],
                            ],
                          ]
                        ],
                      );
                    }
                    // variable type building
                    else if (criteriaModel.variable != null &&
                        criteriaModel.variable?.isNotEmpty == true) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Wrap(
                              children: [
                                for (int index2 = 0;
                                    index2 < (criteriaModel.text?.length ?? 0);
                                    index2++) ...[
                                  if (criteriaModel.text?[index2] is int?) ...[
                                    GestureDetector(
                                      onTap: () {
                                        navigateToDesiredScreen(
                                            variable: criteriaModel.variable,
                                            currentValue:
                                                criteriaModel.text?[index2],
                                            name:
                                                widget.criteriaScreenArgs.name);
                                      },
                                      child: Text(
                                        "(${criteriaModel.text?[index2]})",
                                        style: TextThemeHelper
                                            .blue_16_600_underline,
                                      ),
                                    ),
                                  ] else ...[
                                    Text(
                                      "${criteriaModel.text?[index2]}",
                                      style: TextThemeHelper.white_16_600,
                                    ),
                                  ],
                                ],
                              ],
                            ),
                          ),
                          if (index1 <
                              (widget.criteriaScreenArgs.criteriaList.length -
                                  1)) ...[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                "and",
                                style: TextThemeHelper.white_12_400,
                              ),
                            ),
                          ],
                        ],
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
