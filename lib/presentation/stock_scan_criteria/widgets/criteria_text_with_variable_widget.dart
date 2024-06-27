import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stock_scan_parser/presentation/indicator_variable/indicator_variable_page.dart';
import 'package:stock_scan_parser/presentation/stock_scan_criteria/widgets/variable_type_enum.dart';
import 'package:stock_scan_parser/presentation/value_variable/value_variable_page.dart';

import '../../../network/models/stock_scan_resp.dart';

class CriteriaTextWithVariableWidget extends StatelessWidget {
  final Criteria criteria;

  const CriteriaTextWithVariableWidget({super.key, required this.criteria});

  @override
  Widget build(BuildContext context) {
    List<String> splitText = criteria.text.split(" ");
    RegExp regExp = RegExp(r"^\$[0-9]+$");

    return RichText(
        text: TextSpan(
            children: List.generate(splitText.length, (index) {
      String text = splitText[index];
      bool isVariable = regExp.hasMatch(text);
      return TextSpan(
        text: (isVariable ? "(${_getDefaultValue(text) ?? ""})" : text) +
            (index != splitText.length - 1 ? " " : ""),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (isVariable) {
              if (criteria.variable?[text]?["type"] ==
                  VariableType.value.name) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ValueVariablePage(
                            values:
                                criteria.variable?[text]?["values"].cast<num>(),
                          )),
                );
              } else if (criteria.variable?[text]?["type"] ==
                  VariableType.indicator.name) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IndicatorVariablePage(
                            indicatorData: criteria.variable![text]!,
                          )),
                );
              }
            }
          },
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isVariable ? Colors.blueAccent : Colors.white,
              decoration: isVariable ? TextDecoration.underline : null,
            ),
      );
    })));
  }

  String? _getDefaultValue(String text) {
    if (criteria.variable?[text]?["type"] == VariableType.value.name) {
      return criteria.variable?[text]?["values"][0].toString();
    } else if (criteria.variable?[text]?["type"] ==
        VariableType.indicator.name) {
      return criteria.variable?[text]?["default_value"].toString();
    }
    return null;
  }
}
