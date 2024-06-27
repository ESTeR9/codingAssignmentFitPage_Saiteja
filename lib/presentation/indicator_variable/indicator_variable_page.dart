import 'package:flutter/material.dart';
import 'package:stock_scan_parser/extensions/string_extensions.dart';

import '../../language/locale_text.dart';

class IndicatorVariablePage extends StatelessWidget {
  final Map<String, dynamic> indicatorData;

  const IndicatorVariablePage({super.key, required this.indicatorData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleTextFetcher.getText(
                  "indicator_variable_page_app_bar_title") ??
              ""),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.only(
                      left: 16, top: 40, right: 16, bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        indicatorData["study_type"].toString().toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        LocaleTextFetcher.getText(
                                "indicator_text_set_parameters") ??
                            "",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Container(
                          color: Theme.of(context).cardColor,
                          padding: const EdgeInsets.only(
                              left: 12, top: 12, right: 12, bottom: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  indicatorData["parameter_name"]
                                      .toString()
                                      .capitalize(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  initialValue:
                                      indicatorData["default_value"].toString(),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            )));
  }
}
