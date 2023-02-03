import 'package:stock_scan_parser/common/helpers/app_helper.dart';

class StockScanParserModel {
  int? id;
  String? name;
  String? tag;
  String? color;
  List<CriteriaModel>? criteriaList = [];

  StockScanParserModel({
    this.color,
    this.id,
    this.name,
    this.tag,
    this.criteriaList,
  });

  StockScanParserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      final criteriaArray = json['criteria'];

      for (int index = 0; index < criteriaArray.length; index++) {
        CriteriaModel model = CriteriaModel.fromJson(criteriaArray[index]);
        criteriaList?.add(model);
      }
    }
  }
}

class CriteriaModel {
  String? type;
  List<dynamic>? text = [];
  Map<String, VariableModel?>? variable = {};

  CriteriaModel({
    this.type,
    this.text,
    this.variable,
  });

  CriteriaModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];

    if (json['variable'] != null) {
      json['variable'].forEach((key, value) {
        String modifiedKey = CriteriaTextModifier.replaceDollar(text: key);
        VariableModel model = VariableModel.fromJson(value);
        variable?[modifiedKey] = model;
      });
      text?.addAll(CriteriaTextModifier.getModifiedCriteriaText(
        text: json['text'],
        type: type,
        variable: variable,
      ));
    } else {
      text?.addAll(CriteriaTextModifier.getModifiedCriteriaText(
        text: json['text'],
        type: type,
        variable: null,
      ));
    }
  }
}

class VariableModel {
  String? type;
  String? studyType;
  String? parameterName;
  int? minValue;
  int? maxValue;
  int? defaultValue;
  List<int?>? values;

  VariableModel({
    this.type,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
    this.values,
  });

  VariableModel.fromJson(Map<String, dynamic> json) {
    type = json['type']?.toString();
    studyType = json['study_type']?.toString();
    parameterName = json['parameter_name']?.toString();
    minValue = json['min_value']?.toInt();
    maxValue = json['max_value']?.toInt();
    defaultValue = json['default_value']?.toInt();
    if (json['values'] != null) {
      final v = json['values'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      values = arr0;
    }
  }
}

class CriteriaTextModifier {
  static List<dynamic> getModifiedCriteriaText({
    required String? text,
    required String? type,
    required Map<String, VariableModel?>? variable,
  }) {
    if (AppHelper.isNotEmpty(type) && AppHelper.isNotEmpty(text)) {
      List<dynamic> modifiedTextList = [];

      if (type == "plain_text") {
        modifiedTextList.add(text);
      } else if (variable != null && variable.isNotEmpty == true) {
        String currentValue = "";
        int index = 0;
        while (index < (text?.length ?? 0)) {
          if (text?[index] == "\$") {
            modifiedTextList.add(currentValue);
            currentValue = '';
            index++;

            while (index < (text?.length ?? 0) &&
                int.tryParse(text?[index] ?? '') != null) {
              currentValue += "${text?[index]}";
              index++;
            }

            VariableModel? model = variable[currentValue];
            if (model != null) {
              if (model.defaultValue != null) {
                modifiedTextList.add(model.defaultValue);
              } else if (model.values != null &&
                  model.values?.isNotEmpty == true) {
                modifiedTextList.add(model.values?[0]);
              }
            }
            currentValue = '';
            continue;
          } else {
            currentValue += text?[index] ?? '';
            index++;
          }
        }

        if (currentValue.isNotEmpty) {
          modifiedTextList.add(currentValue);
        }
      }

      return modifiedTextList;
    }
    return [];
  }

  static String replaceDollar({String? text}) {
    return text?.replaceAll("\$", "") ?? "";
  }
}
