import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stock_scan_parser/network/helpers/base_network_response.dart';

class APIBaseHelper {
  static const String tag = "APIBaseHelper";
  Dio dio = Dio();

  Future<BaseNetworkResponse> get({
    required String url,
  }) async {
    late BaseNetworkResponse baseNetworkResponse;

    try {
      final response = await dio.get(url);
      baseNetworkResponse = BaseNetworkResponse(
        httpCode: response.statusCode ?? -1,
        response: response,
      );
      return baseNetworkResponse;
    } on DioError catch (error) {
      log("$tag ======= ${error.response} ====== $url");
      baseNetworkResponse = BaseNetworkResponse(
        httpCode: -1,
        response: null,
      );
      return baseNetworkResponse;
    }
  }
}
