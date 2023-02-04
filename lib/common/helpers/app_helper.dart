import 'package:dio/dio.dart';
import 'package:stock_scan_parser/stock_parser/models/stock_scan_parser_model.dart';

class AppHelper {
  static bool isNotEmpty(String? string) {
    return string != null && string.isNotEmpty;
  }

  static String replaceDollar({String? text}) {
    return text?.replaceAll("\$", "") ?? "";
  }

  static List<StockScanParserModel?> convertToStockParserModel(
      {Response<dynamic>? response}) {
    List<StockScanParserModel?> stockScanParserList = [];

    for (int index = 0; index < response?.data.length; index++) {
      StockScanParserModel model =
          StockScanParserModel.fromJson(response?.data[index]);

      stockScanParserList.add(model);
    }

    return stockScanParserList;
  }
}
