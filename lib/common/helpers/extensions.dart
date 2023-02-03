import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parser/stock_parser/cubit/stock_scan_parser_cubit.dart';

extension BuildContextX on BuildContext {
  StockScanParserCubit get stockScanParserCubit => read<StockScanParserCubit>();
}
