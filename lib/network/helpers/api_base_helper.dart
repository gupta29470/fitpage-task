import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stock_scan_parser/network/helpers/base_network_response.dart';

class APIBaseHelper {
  static const String tag = "APIBaseHelper";

  static Dio? _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://coding-assignment.bombayrunning.com",
      ),
    );
  }

  static get dio {
    if (_dio == null) {
      throw FlutterError(
          "Dio is not inittialised, please call init before accessing dio");
    } else {
      return _dio;
    }
  }

  static closeDio() {
    _dio?.close();
    _dio = null;
  }

  static Future<BaseNetworkResponse> get({
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
