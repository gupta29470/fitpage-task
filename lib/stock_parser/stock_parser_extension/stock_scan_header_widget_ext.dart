part of '../widgets/stock_scan_header_widget.dart';

extension on StockScanHeaderWidget {
  bool isTagBullish(String text) {
    return text.toLowerCase().contains("bullish");
  }
}
