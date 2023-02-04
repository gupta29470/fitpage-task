import 'dart:developer';

import 'package:stock_scan_parser/common/helpers/app_helper.dart';
import 'package:stock_scan_parser/network/constants/apis.dart';
import 'package:stock_scan_parser/network/helpers/api_base_helper.dart';
import 'package:stock_scan_parser/network/helpers/base_network_response.dart';
import 'package:stock_scan_parser/stock_parser/models/stock_scan_parser_model.dart';

class StockScanParserRepository {
  static const String tag = "StockScanParserRepository";

  final APIBaseHelper _apiBaseHelper = APIBaseHelper();

  Future<List<StockScanParserModel?>> getStockParserData() async {
    try {
      BaseNetworkResponse response =
          await _apiBaseHelper.get(url: APIs.getStockScanParser);

      if (response.isSuccess() &&
          response.response?.data != null &&
          response.response?.data.isNotEmpty) {
        return AppHelper.convertToStockParserModel(
          response: response.response,
        );
      } else {
        log("$tag ====== ${response.httpCode}");
        return [];
      }
    } catch (error) {
      log("$tag ====== $error");
      return [];
    }
  }
}
