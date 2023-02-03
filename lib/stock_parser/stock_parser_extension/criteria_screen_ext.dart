part of '../screens/criteria_screen.dart';

extension on _CriteriaScreenState {
  bool isPlainText(String? type) {
    return type == "plain_text";
  }

  void navigateToDesiredScreen({
    required Map<String, VariableModel?>? variable,
    required int? currentValue,
    required String? name,
  }) {
    bool isDefault = false;
    List<int?> values = [];

    variable?.forEach((key, value) {
      if (value?.defaultValue == currentValue) {
        isDefault = true;
      } else if (value?.values?.contains(currentValue) == true) {
        values = value?.values ?? [];
      }
    });

    if (isDefault) {
      NavigationHelper.navigateToRoute(
        context,
        RouteHelper.defaultScr,
        DefaultValueScreenArgs(
          defaultValue: currentValue,
          heading: AppHelper.isNotEmpty(name) ? name?.split(" ")[0] : "",
        ),
      );
    } else {
      values.sort();
      NavigationHelper.navigateToRoute(
        context,
        RouteHelper.valuesScr,
        ValuesScreenArgs(
          values: values,
        ),
      );
    }
  }
}
