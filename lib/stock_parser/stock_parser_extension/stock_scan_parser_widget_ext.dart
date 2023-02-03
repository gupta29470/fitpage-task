part of '../widgets/stock_scan_parser_widget.dart';

extension on _StockScanParserWidgetState {
  void navigateToCriteriaScreen(StockScanParserModel? model) {
    NavigationHelper.navigateToRoute(
      context,
      RouteHelper.criteriaScr,
      CriteriaScreenArgs(
        tag: model?.tag,
        name: model?.name,
        criteriaList: model?.criteriaList ?? [],
      ),
    );
  }
}
