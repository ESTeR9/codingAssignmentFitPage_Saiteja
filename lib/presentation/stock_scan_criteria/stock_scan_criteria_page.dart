import 'package:flutter/material.dart';
import 'package:stock_scan_parser/language/locale_text.dart';
import 'package:stock_scan_parser/presentation/stock_scan_criteria/widgets/criteria_text_with_variable_widget.dart';

import '../../network/models/stock_scan_resp.dart';
import '../../util/color_utility.dart';

class StockScanCriteriaPage extends StatelessWidget {
  final StockScan stockScan;

  const StockScanCriteriaPage({super.key, required this.stockScan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            LocaleTextFetcher.getText("criteria_page_app_bar_title") ?? ""),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).secondaryHeaderColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stockScan.name,
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            stockScan.tag,
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: colorMap[stockScan.color]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: stockScan.criteria.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (stockScan.criteria[index].variable == null)
                                    ? Text(
                                        stockScan.criteria[index].text,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      )
                                    : CriteriaTextWithVariableWidget(
                                        criteria: stockScan.criteria[index]),
                                index != (stockScan.criteria.length - 1)
                                    ? Column(
                                        children: [
                                          const SizedBox(height: 8),
                                          Text(
                                            LocaleTextFetcher.getText(
                                                    "criteria_page_conjunction") ??
                                                "",
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
