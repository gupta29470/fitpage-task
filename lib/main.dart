import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parser/common/helpers/navigation_helper.dart';
import 'package:stock_scan_parser/stock_parser/cubit/stock_scan_parser_cubit.dart';
import 'package:stock_scan_parser/stock_parser/repository/stock_scan_parser_repository.dart';
import 'package:stock_scan_parser/stock_parser/screens/stock_scan_parser_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: NavigationHelper.generateRoute,
      onGenerateInitialRoutes: (String initialRouteName) {
        return [
          MaterialPageRoute(
            builder: (_) => const MyHomePage(),
          ),
        ];
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => StockScanParserRepository(),
      child: BlocProvider(
        create: (context) => StockScanParserCubit(
          RepositoryProvider.of<StockScanParserRepository>(context),
        ),
        child: const StockScanParserScreen(),
      ),
    );
  }
}
