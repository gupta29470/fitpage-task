import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parser/common/helpers/extensions.dart';
import 'package:stock_scan_parser/stock_parser/cubit/stock_scan_parser_cubit.dart';
import 'package:stock_scan_parser/stock_parser/widgets/stock_scan_parser_widget.dart';
import 'package:stock_scan_parser/styles/colors/app_color_helper.dart';
import 'package:stock_scan_parser/styles/themes/text_theme_helper.dart';

class StockScanParserScreen extends StatefulWidget {
  const StockScanParserScreen({super.key});

  @override
  State<StockScanParserScreen> createState() => _StockScanParserScreenState();
}

class _StockScanParserScreenState extends State<StockScanParserScreen> {
  @override
  void initState() {
    context.stockScanParserCubit.getStockParserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.kuretakeBlackManga,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 40,
        ),
        child: BlocBuilder<StockScanParserCubit, StockScanParserState>(
          builder: (_, state) {
            return state.maybeWhen(
              orElse: () {
                return Text(
                  "Something went wrong while getting data",
                  style: TextThemeHelper.white_16_600,
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColorHelper.white,
                  ),
                );
              },
              success: (stockScanParserModelList) {
                return StockScanParserWidget(
                  stockScanParserModelList: stockScanParserModelList,
                );
              },
              failure: (errorText) {
                return Text(errorText);
              },
            );
          },
        ),
      ),
    );
  }
}
