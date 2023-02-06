import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stock_scan_parser/stock_parser/models/stock_scan_parser_model.dart';
import 'package:stock_scan_parser/stock_parser/repository/stock_scan_parser_repository.dart';

part 'stock_scan_parser_state.dart';
part 'stock_scan_parser_cubit.freezed.dart';

class StockScanParserCubit extends Cubit<StockScanParserState> {
  final StockScanParserRepository _stockScanParserRepository;

  StockScanParserCubit(this._stockScanParserRepository)
      : super(
          const StockScanParserState.initial(),
        );

  Future<void> getStockParserData() async {
    emit(const StockScanParserState.loading());
    try {
      List<StockScanParserModel?> stockScanParserModelList =
          await _stockScanParserRepository.getStockParserData();

      if (stockScanParserModelList.isNotEmpty) {
        emit(
          StockScanParserState.success(
            stockScanParserModelList: stockScanParserModelList,
          ),
        );
      } else {
        emit(
          const StockScanParserState.failure(
              errorText: "Something went wrong while get stock scan data"),
        );
      }
    } catch (error) {
      emit(
        StockScanParserState.failure(errorText: "$error"),
      );
    }
  }
}
