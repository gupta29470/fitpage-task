import 'package:flutter/material.dart';
import 'package:stock_scan_parser/common/helpers/route_helper.dart';
import 'package:stock_scan_parser/main.dart';
import 'package:stock_scan_parser/stock_parser/models/criteria_screen_args.dart';
import 'package:stock_scan_parser/stock_parser/models/default_values_screen_args.dart';
import 'package:stock_scan_parser/stock_parser/models/values_screen_args.dart';
import 'package:stock_scan_parser/stock_parser/screens/criteria_screen.dart';
import 'package:stock_scan_parser/stock_parser/screens/default_value_screen.dart';
import 'package:stock_scan_parser/stock_parser/screens/values_screen.dart';

class NavigationHelper {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteHelper.criteriaScr:
        return getPageTransitionRoute(
          settings,
          CriteriaScreen(
            criteriaScreenArgs: settings.arguments as CriteriaScreenArgs,
          ),
        );

      case RouteHelper.valuesScr:
        return getPageTransitionRoute(
          settings,
          ValuesScreen(
            valuesScreenArgs: settings.arguments as ValuesScreenArgs,
          ),
        );

      case RouteHelper.defaultScr:
        return getPageTransitionRoute(
          settings,
          DefaultValueScreen(
            defaultValueScreenArgs:
                settings.arguments as DefaultValueScreenArgs,
          ),
        );

      default:
        return getPageTransitionRoute(
          settings,
          const MyHomePage(),
        );
    }
  }

  static Future<T?> navigateToRoute<T>(
    BuildContext context,
    String routeName,
    dynamic args,
  ) {
    return Navigator.pushNamed(
      context,
      routeName,
      arguments: args,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static MaterialPageRoute getPageTransitionRoute(
    RouteSettings settings,
    Widget widget,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
