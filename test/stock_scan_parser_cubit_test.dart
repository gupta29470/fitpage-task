import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stock_scan_parser/common/helpers/app_helper.dart';
import 'package:stock_scan_parser/stock_parser/cubit/stock_scan_parser_cubit.dart';
import 'package:stock_scan_parser/stock_parser/models/stock_scan_parser_model.dart';
import 'package:stock_scan_parser/stock_parser/repository/stock_scan_parser_repository.dart';

import 'test_data.dart';

class MockStockScanParserRepository extends Mock
    implements StockScanParserRepository {}

void main() {
  late StockScanParserCubit stockScanParserCubit;
  late MockStockScanParserRepository mockStockScanParserRepository;

  void arrangeStockScanParserRepository({
    required List<Map<String, Object>> jsonData,
  }) {
    return when(() => mockStockScanParserRepository.getStockParserData())
        .thenAnswer((_) async {
      return AppHelper.convertToStockParserModel(
        data: jsonData,
      );
    });
  }

  setUp(() {
    mockStockScanParserRepository = MockStockScanParserRepository();
    stockScanParserCubit = StockScanParserCubit(mockStockScanParserRepository);
  });

  test("Check loading and Success State", () async {
    arrangeStockScanParserRepository(
      jsonData: TestData.jsonData,
    );

    final future = stockScanParserCubit.getStockParserData();

    expect(
      stockScanParserCubit.state.loading,
      const StockScanParserState.loading(),
    );

    expect(
      stockScanParserCubit.state.stockScanParserModelList,
      [],
    );

    await future;

    expect(
      stockScanParserCubit.state.success(
        stockScanParserModelList:
            stockScanParserCubit.state.stockScanParserModelList,
      ),
      StockScanParserState.success(
        stockScanParserModelList:
            stockScanParserCubit.state.stockScanParserModelList,
      ),
    );

    expect(
      stockScanParserCubit.state.stockScanParserModelList,
      isA<List<StockScanParserModel?>>(),
    );
  });

  test("Check loading and Failure State", () async {
    arrangeStockScanParserRepository(
      jsonData: [],
    );

    final future = stockScanParserCubit.getStockParserData();

    expect(
      stockScanParserCubit.state.loading,
      const StockScanParserState.loading(),
    );

    expect(
      stockScanParserCubit.state.stockScanParserModelList,
      [],
    );

    await future;

    expect(
      stockScanParserCubit.state.failure(
        errorText: stockScanParserCubit.state.errorText,
      ),
      StockScanParserState.failure(
        errorText: stockScanParserCubit.state.errorText,
      ),
    );

    expect(
      stockScanParserCubit.state.stockScanParserModelList,
      isA<List>(),
    );
  });
}
