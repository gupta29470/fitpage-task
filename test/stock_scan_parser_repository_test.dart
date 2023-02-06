import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stock_scan_parser/common/helpers/app_helper.dart';
import 'package:stock_scan_parser/network/constants/apis.dart';
import 'package:stock_scan_parser/network/helpers/api_base_helper.dart';
import 'package:stock_scan_parser/stock_parser/models/stock_scan_parser_model.dart';
import 'package:stock_scan_parser/stock_parser/repository/stock_scan_parser_repository.dart';

import 'test_data.dart';

class MockDioAdapter extends DioAdapter with Mock {
  MockDioAdapter(dio) : super(dio: dio);
}

class MockStockScanParserRepository extends Mock
    implements StockScanParserRepository {}

void main() {
  late Dio dio;
  late MockDioAdapter mockDioAdapter;

  setUp(() {
    APIBaseHelper.init();
    dio = APIBaseHelper.dio;
    mockDioAdapter = MockDioAdapter(
      dio,
    );
  });

  tearDown(() {
    APIBaseHelper.closeDio();
    mockDioAdapter.reset();
  });

  test("Stock Scan Parser Repository Test", () async {
    APIBaseHelper.init();
    dio = APIBaseHelper.dio;
    final responsePayload = jsonEncode(TestData.jsonData);

    final mockResponse = ResponseBody.fromString(
      responsePayload,
      200,
    );

    mockDioAdapter.onGet(APIs.getStockScanParser, (server) {
      server.reply(
        200,
        mockResponse,
      );
    });

    final response = await dio.get(
      APIs.getStockScanParser,
    );

    expect(
      response.statusCode,
      200,
    );

    expect(
      AppHelper.convertToStockParserModel(
        data: response.data,
      ),
      isA<List<StockScanParserModel?>>(),
    );
  });

  test("Stock Scan Parser Repository Failure Test", () async {
    mockDioAdapter.onGet(APIs.getStockScanParser, (server) {
      server.reply(
        200,
        [],
      );
    });

    final response = await dio.get(
      APIs.getStockScanParser,
    );

    expect(response.data, isA<List>());

    final parsedResponse = AppHelper.convertToStockParserModel(
      data: response.data,
    );
    expect(
      parsedResponse,
      isA<List<StockScanParserModel?>>(),
    );

    expect(parsedResponse, isEmpty);
  });

  test(
      "Test when APIBaseelper is not initialized, accessing dio sould throw Error",
      () {
    // Uninitializing ApiBaseHelper and closing dio instance
    APIBaseHelper.closeDio();

    expect(() => APIBaseHelper.dio, throwsA(isA<FlutterError>()));
  });
}
