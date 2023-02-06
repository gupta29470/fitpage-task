import 'package:stock_scan_parser/stock_parser/models/stock_scan_parser_model.dart';

class AppHelper {
  static bool isNotEmpty(String? string) {
    return string != null && string.isNotEmpty;
  }

  static String replaceDollar({String? text}) {
    return text?.replaceAll("\$", "") ?? "";
  }

  static List<StockScanParserModel?> convertToStockParserModel({
    dynamic data,
  }) {
    List<StockScanParserModel?> stockScanParserList = [];

    if (data != null) {
      for (int index = 0; index < data.length; index++) {
        StockScanParserModel model = StockScanParserModel.fromJson(data[index]);

        stockScanParserList.add(model);
      }
    }

    return stockScanParserList;
  }
}
