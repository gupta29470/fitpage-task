import 'package:stock_scan_parser/stock_parser/models/stock_scan_parser_model.dart';

class CriteriaScreenArgs {
  final String? tag;
  final String? name;
  final List<CriteriaModel> criteriaList;

  CriteriaScreenArgs({
    required this.tag,
    required this.name,
    required this.criteriaList,
  });
}
