part of 'stock_scan_parser_cubit.dart';

@freezed
class StockScanParserState with _$StockScanParserState {
  const StockScanParserState._();

  const factory StockScanParserState.initial() = Initial;
  const factory StockScanParserState.loading() = Loading;
  const factory StockScanParserState.success({
    required List<StockScanParserModel?> stockScanParserModelList,
  }) = Success;
  const factory StockScanParserState.failure({required String errorText}) =
      Failure;

  bool get isInitial => this is Initial;
  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;
}
